@implementation AWDNetworkPerformanceMetric

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAcceptablePerformanceResult:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_acceptablePerformanceResult = a3;
}

- (void)setHasAcceptablePerformanceResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAcceptablePerformanceResult
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAwdlElectionParameters
{
  return self->_awdlElectionParameters != 0;
}

- (BOOL)hasAwdlMasterChannel
{
  return self->_awdlMasterChannel != 0;
}

- (BOOL)hasAwdlOpMode
{
  return self->_awdlOpMode != 0;
}

- (void)setAwdlPowerState:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_awdlPowerState = a3;
}

- (void)setHasAwdlPowerState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAwdlPowerState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAwdlSchedule
{
  return self->_awdlSchedule != 0;
}

- (BOOL)hasAwdlSecondaryMasterChannel
{
  return self->_awdlSecondaryMasterChannel != 0;
}

- (BOOL)hasAwdlSyncChannelSequence
{
  return self->_awdlSyncChannelSequence != 0;
}

- (BOOL)hasAwdlSyncState
{
  return self->_awdlSyncState != 0;
}

- (BOOL)hasBtConnectedDevicesCount
{
  return self->_btConnectedDevicesCount != 0;
}

- (void)setBtIsConnectable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_btIsConnectable = a3;
}

- (void)setHasBtIsConnectable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBtIsConnectable
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBtIsDiscoverable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_btIsDiscoverable = a3;
}

- (void)setHasBtIsDiscoverable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBtIsDiscoverable
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBtIsPowerOn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_btIsPowerOn = a3;
}

- (void)setHasBtIsPowerOn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBtIsPowerOn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBtIsScanning:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_btIsScanning = a3;
}

- (void)setHasBtIsScanning:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBtIsScanning
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasCallingClient
{
  return self->_callingClient != 0;
}

- (BOOL)hasCellularActiveContexts
{
  return self->_cellularActiveContexts != 0;
}

- (void)setCellularAllowsVoip:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellularAllowsVoip = a3;
}

- (void)setHasCellularAllowsVoip:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellularAllowsVoip
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasCellularAttached
{
  return self->_cellularAttached != 0;
}

- (BOOL)hasCellularBandinfo
{
  return self->_cellularBandinfo != 0;
}

- (BOOL)hasCellularBandwidth
{
  return self->_cellularBandwidth != 0;
}

- (BOOL)hasCellularCarrierName
{
  return self->_cellularCarrierName != 0;
}

- (BOOL)hasCellularDataBearerSoMask
{
  return self->_cellularDataBearerSoMask != 0;
}

- (BOOL)hasCellularDataBearerTechnology
{
  return self->_cellularDataBearerTechnology != 0;
}

- (BOOL)hasCellularDataPlanSignalingReductionOverride
{
  return self->_cellularDataPlanSignalingReductionOverride != 0;
}

- (BOOL)hasCellularDataPossible
{
  return self->_cellularDataPossible != 0;
}

- (BOOL)hasCellularInHomeCountry
{
  return self->_cellularInHomeCountry != 0;
}

- (BOOL)hasCellularIndicator
{
  return self->_cellularIndicator != 0;
}

- (BOOL)hasCellularIndicatorOverride
{
  return self->_cellularIndicatorOverride != 0;
}

- (BOOL)hasCellularIsoCountryCode
{
  return self->_cellularIsoCountryCode != 0;
}

- (BOOL)hasCellularLqm
{
  return self->_cellularLqm != 0;
}

- (BOOL)hasCellularLteMaxScheduledLayers
{
  return self->_cellularLteMaxScheduledLayers != 0;
}

- (BOOL)hasCellularMobileCountryCode
{
  return self->_cellularMobileCountryCode != 0;
}

- (BOOL)hasCellularMobileNetworkCode
{
  return self->_cellularMobileNetworkCode != 0;
}

- (BOOL)hasCellularNewRadioCoverage
{
  return self->_cellularNewRadioCoverage != 0;
}

- (BOOL)hasCellularNewRadioDataBearer
{
  return self->_cellularNewRadioDataBearer != 0;
}

- (BOOL)hasCellularNewRadioMmwaveDataBearer
{
  return self->_cellularNewRadioMmwaveDataBearer != 0;
}

- (BOOL)hasCellularNewRadioNsaCoverage
{
  return self->_cellularNewRadioNsaCoverage != 0;
}

- (BOOL)hasCellularNewRadioNsaDataBearer
{
  return self->_cellularNewRadioNsaDataBearer != 0;
}

- (BOOL)hasCellularNewRadioSaCoverage
{
  return self->_cellularNewRadioSaCoverage != 0;
}

- (BOOL)hasCellularNewRadioSaDataBearer
{
  return self->_cellularNewRadioSaDataBearer != 0;
}

- (BOOL)hasCellularNewRadioSub6DataBearer
{
  return self->_cellularNewRadioSub6DataBearer != 0;
}

- (BOOL)hasCellularNrConfiguredBw
{
  return self->_cellularNrConfiguredBw != 0;
}

- (BOOL)hasCellularNrLayers
{
  return self->_cellularNrLayers != 0;
}

- (BOOL)hasCellularNrModulation
{
  return self->_cellularNrModulation != 0;
}

- (BOOL)hasCellularNrRsrp
{
  return self->_cellularNrRsrp != 0;
}

- (BOOL)hasCellularNrRsrq
{
  return self->_cellularNrRsrq != 0;
}

- (BOOL)hasCellularNrSnr
{
  return self->_cellularNrSnr != 0;
}

- (BOOL)hasCellularPid
{
  return self->_cellularPid != 0;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology != 0;
}

- (BOOL)hasCellularRadioAccessTechnologyCtDataStatus
{
  return self->_cellularRadioAccessTechnologyCtDataStatus != 0;
}

- (BOOL)hasCellularRoamAllowed
{
  return self->_cellularRoamAllowed != 0;
}

- (BOOL)hasCellularRsrp
{
  return self->_cellularRsrp != 0;
}

- (BOOL)hasCellularSnr
{
  return self->_cellularSnr != 0;
}

- (BOOL)hasCellularTac
{
  return self->_cellularTac != 0;
}

- (BOOL)hasCellularTotalActiveContexts
{
  return self->_cellularTotalActiveContexts != 0;
}

- (BOOL)hasCellularTotalBw
{
  return self->_cellularTotalBw != 0;
}

- (BOOL)hasCellularTotalCcs
{
  return self->_cellularTotalCcs != 0;
}

- (BOOL)hasCellularTotalLayers
{
  return self->_cellularTotalLayers != 0;
}

- (BOOL)hasCellularUarfcn
{
  return self->_cellularUarfcn != 0;
}

- (BOOL)hasDownloadCdnPop
{
  return self->_downloadCdnPop != 0;
}

- (BOOL)hasDownloadCdnUuid
{
  return self->_downloadCdnUuid != 0;
}

- (BOOL)hasDownloadConnectionTime
{
  return self->_downloadConnectionTime != 0;
}

- (BOOL)hasDownloadDomainLookupTime
{
  return self->_downloadDomainLookupTime != 0;
}

- (BOOL)hasDownloadEndDataBearerTechnology
{
  return self->_downloadEndDataBearerTechnology != 0;
}

- (BOOL)hasDownloadEndPrimaryIpv4Interface
{
  return self->_downloadEndPrimaryIpv4Interface != 0;
}

- (BOOL)hasDownloadEndRat
{
  return self->_downloadEndRat != 0;
}

- (BOOL)hasDownloadFileSize
{
  return self->_downloadFileSize != 0;
}

- (BOOL)hasDownloadInterfaceName
{
  return self->_downloadInterfaceName != 0;
}

- (BOOL)hasDownloadInterfaceServiceName
{
  return self->_downloadInterfaceServiceName != 0;
}

- (void)setDownloadIsCellular:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_downloadIsCellular = a3;
}

- (void)setHasDownloadIsCellular:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasDownloadIsCellular
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDownloadIsConstrained:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_downloadIsConstrained = a3;
}

- (void)setHasDownloadIsConstrained:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDownloadIsConstrained
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDownloadIsExpensive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_downloadIsExpensive = a3;
}

- (void)setHasDownloadIsExpensive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasDownloadIsExpensive
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDownloadIsMultipath:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_downloadIsMultipath = a3;
}

- (void)setHasDownloadIsMultipath:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasDownloadIsMultipath
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDownloadIsProxyConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_downloadIsProxyConnection = a3;
}

- (void)setHasDownloadIsProxyConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasDownloadIsProxyConnection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDownloadIsReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_downloadIsReusedConnection = a3;
}

- (void)setHasDownloadIsReusedConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDownloadIsReusedConnection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasDownloadMaxSpeedObserved
{
  return self->_downloadMaxSpeedObserved != 0;
}

- (BOOL)hasDownloadNumberOfStreams
{
  return self->_downloadNumberOfStreams != 0;
}

- (BOOL)hasDownloadProtocolName
{
  return self->_downloadProtocolName != 0;
}

- (BOOL)hasDownloadRemoteAddress
{
  return self->_downloadRemoteAddress != 0;
}

- (BOOL)hasDownloadRemotePort
{
  return self->_downloadRemotePort != 0;
}

- (BOOL)hasDownloadRequestTime
{
  return self->_downloadRequestTime != 0;
}

- (BOOL)hasDownloadRequestToResponseTime
{
  return self->_downloadRequestToResponseTime != 0;
}

- (BOOL)hasDownloadResponseTime
{
  return self->_downloadResponseTime != 0;
}

- (BOOL)hasDownloadSecureConnectionTime
{
  return self->_downloadSecureConnectionTime != 0;
}

- (BOOL)hasDownloadServer
{
  return self->_downloadServer != 0;
}

- (BOOL)hasDownloadSpeed
{
  return self->_downloadSpeed != 0;
}

- (BOOL)hasDownloadStableSpeed
{
  return self->_downloadStableSpeed != 0;
}

- (BOOL)hasDownloadStartDataBearerTechnology
{
  return self->_downloadStartDataBearerTechnology != 0;
}

- (BOOL)hasDownloadStartPrimaryIpv4Interface
{
  return self->_downloadStartPrimaryIpv4Interface != 0;
}

- (BOOL)hasDownloadStartRat
{
  return self->_downloadStartRat != 0;
}

- (void)setNetworkIsAppleReachable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_networkIsAppleReachable = a3;
}

- (void)setHasNetworkIsAppleReachable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNetworkIsAppleReachable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasNetworkPrimaryIpv4InterfaceName
{
  return self->_networkPrimaryIpv4InterfaceName != 0;
}

- (BOOL)hasNetworkPrimaryIpv4ServiceName
{
  return self->_networkPrimaryIpv4ServiceName != 0;
}

- (BOOL)hasNptkitFrameworkVersion
{
  return self->_nptkitFrameworkVersion != 0;
}

- (BOOL)hasPerformanceTestStartTime
{
  return self->_performanceTestStartTime != 0;
}

- (BOOL)hasPingAddress
{
  return self->_pingAddress != 0;
}

- (BOOL)hasPingLossPercent
{
  return self->_pingLossPercent != 0;
}

- (BOOL)hasPingMaxLatency
{
  return self->_pingMaxLatency != 0;
}

- (BOOL)hasPingMeanLatency
{
  return self->_pingMeanLatency != 0;
}

- (BOOL)hasPingMinLatency
{
  return self->_pingMinLatency != 0;
}

- (BOOL)hasPingStandardDeviation
{
  return self->_pingStandardDeviation != 0;
}

- (BOOL)hasPowerBatteryWarningLevel
{
  return self->_powerBatteryWarningLevel != 0;
}

- (BOOL)hasPowerSourceType
{
  return self->_powerSourceType != 0;
}

- (BOOL)hasPowerStateCaps
{
  return self->_powerStateCaps != 0;
}

- (BOOL)hasSystemActiveProcessorCount
{
  return self->_systemActiveProcessorCount != 0;
}

- (BOOL)hasSystemBatteryLevel
{
  return self->_systemBatteryLevel != 0;
}

- (BOOL)hasSystemBatteryState
{
  return self->_systemBatteryState != 0;
}

- (BOOL)hasSystemDeviceClass
{
  return self->_systemDeviceClass != 0;
}

- (BOOL)hasSystemDeviceModel
{
  return self->_systemDeviceModel != 0;
}

- (void)setSystemLowPowerModeEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_systemLowPowerModeEnabled = a3;
}

- (void)setHasSystemLowPowerModeEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSystemLowPowerModeEnabled
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasSystemName
{
  return self->_systemName != 0;
}

- (BOOL)hasSystemOsVariant
{
  return self->_systemOsVariant != 0;
}

- (BOOL)hasSystemPhysicalMemory
{
  return self->_systemPhysicalMemory != 0;
}

- (void)setSystemPowersourceConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_systemPowersourceConnected = a3;
}

- (void)setHasSystemPowersourceConnected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSystemPowersourceConnected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasSystemProcessorCount
{
  return self->_systemProcessorCount != 0;
}

- (BOOL)hasSystemVersion
{
  return self->_systemVersion != 0;
}

- (BOOL)hasUploadCdnPop
{
  return self->_uploadCdnPop != 0;
}

- (BOOL)hasUploadCdnUuid
{
  return self->_uploadCdnUuid != 0;
}

- (BOOL)hasUploadConnectionTime
{
  return self->_uploadConnectionTime != 0;
}

- (BOOL)hasUploadDomainLookupTime
{
  return self->_uploadDomainLookupTime != 0;
}

- (BOOL)hasUploadEndDataBearerTechnology
{
  return self->_uploadEndDataBearerTechnology != 0;
}

- (BOOL)hasUploadEndPrimaryIpv4Interface
{
  return self->_uploadEndPrimaryIpv4Interface != 0;
}

- (BOOL)hasUploadEndRat
{
  return self->_uploadEndRat != 0;
}

- (BOOL)hasUploadFileSize
{
  return self->_uploadFileSize != 0;
}

- (BOOL)hasUploadInterfaceName
{
  return self->_uploadInterfaceName != 0;
}

- (BOOL)hasUploadInterfaceServiceName
{
  return self->_uploadInterfaceServiceName != 0;
}

- (void)setUploadIsCellular:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_uploadIsCellular = a3;
}

- (void)setHasUploadIsCellular:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUploadIsCellular
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUploadIsConstrained:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_uploadIsConstrained = a3;
}

- (void)setHasUploadIsConstrained:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUploadIsConstrained
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setUploadIsExpensive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_uploadIsExpensive = a3;
}

- (void)setHasUploadIsExpensive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasUploadIsExpensive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setUploadIsMultipath:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_uploadIsMultipath = a3;
}

- (void)setHasUploadIsMultipath:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUploadIsMultipath
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setUploadIsProxyConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_uploadIsProxyConnection = a3;
}

- (void)setHasUploadIsProxyConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUploadIsProxyConnection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setUploadIsReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_uploadIsReusedConnection = a3;
}

- (void)setHasUploadIsReusedConnection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasUploadIsReusedConnection
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasUploadMaxSpeedObserved
{
  return self->_uploadMaxSpeedObserved != 0;
}

- (BOOL)hasUploadNumberOfStreams
{
  return self->_uploadNumberOfStreams != 0;
}

- (BOOL)hasUploadProtocolName
{
  return self->_uploadProtocolName != 0;
}

- (BOOL)hasUploadRemoteAddress
{
  return self->_uploadRemoteAddress != 0;
}

- (BOOL)hasUploadRemotePort
{
  return self->_uploadRemotePort != 0;
}

- (BOOL)hasUploadRequestTime
{
  return self->_uploadRequestTime != 0;
}

- (BOOL)hasUploadRequestToResponseTime
{
  return self->_uploadRequestToResponseTime != 0;
}

- (BOOL)hasUploadResponseTime
{
  return self->_uploadResponseTime != 0;
}

- (BOOL)hasUploadSecureConnectionTime
{
  return self->_uploadSecureConnectionTime != 0;
}

- (BOOL)hasUploadServer
{
  return self->_uploadServer != 0;
}

- (BOOL)hasUploadSpeed
{
  return self->_uploadSpeed != 0;
}

- (BOOL)hasUploadStableSpeed
{
  return self->_uploadStableSpeed != 0;
}

- (BOOL)hasUploadStartDataBearerTechnology
{
  return self->_uploadStartDataBearerTechnology != 0;
}

- (BOOL)hasUploadStartPrimaryIpv4Interface
{
  return self->_uploadStartPrimaryIpv4Interface != 0;
}

- (BOOL)hasUploadStartRat
{
  return self->_uploadStartRat != 0;
}

- (void)setUseWifiWasSpecified:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_useWifiWasSpecified = a3;
}

- (void)setHasUseWifiWasSpecified:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUseWifiWasSpecified
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasWifiAveragePhyRateRx
{
  return self->_wifiAveragePhyRateRx != 0;
}

- (BOOL)hasWifiAverageRssi
{
  return self->_wifiAverageRssi != 0;
}

- (BOOL)hasWifiAverageSnr
{
  return self->_wifiAverageSnr != 0;
}

- (BOOL)hasWifiAverageTcpRtt
{
  return self->_wifiAverageTcpRtt != 0;
}

- (BOOL)hasWifiBtcMode
{
  return self->_wifiBtcMode != 0;
}

- (BOOL)hasWifiCca
{
  return self->_wifiCca != 0;
}

- (BOOL)hasWifiChannel
{
  return self->_wifiChannel != 0;
}

- (BOOL)hasWifiCwfCca
{
  return self->_wifiCwfCca != 0;
}

- (BOOL)hasWifiEapolControlMode
{
  return self->_wifiEapolControlMode != 0;
}

- (BOOL)hasWifiEapolSupplicantState
{
  return self->_wifiEapolSupplicantState != 0;
}

- (BOOL)hasWifiGuardInterval
{
  return self->_wifiGuardInterval != 0;
}

- (BOOL)hasWifiHiddenState
{
  return self->_wifiHiddenState != 0;
}

- (void)setWifiIsCaptive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_wifiIsCaptive = a3;
}

- (void)setHasWifiIsCaptive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasWifiIsCaptive
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (BOOL)hasWifiMcsIndex
{
  return self->_wifiMcsIndex != 0;
}

- (BOOL)hasWifiNoise
{
  return self->_wifiNoise != 0;
}

- (BOOL)hasWifiNumberOfSpatialStreams
{
  return self->_wifiNumberOfSpatialStreams != 0;
}

- (BOOL)hasWifiOpMode
{
  return self->_wifiOpMode != 0;
}

- (BOOL)hasWifiPhyMode
{
  return self->_wifiPhyMode != 0;
}

- (BOOL)hasWifiRssi
{
  return self->_wifiRssi != 0;
}

- (BOOL)hasWifiSecurity
{
  return self->_wifiSecurity != 0;
}

- (BOOL)hasWifiTxRate
{
  return self->_wifiTxRate != 0;
}

- (BOOL)hasWrmChannelType
{
  return self->_wrmChannelType != 0;
}

- (BOOL)hasCellularCellid
{
  return self->_cellularCellid != 0;
}

- (BOOL)hasNetworkQualityResponsiveness
{
  return self->_networkQualityResponsiveness != 0;
}

- (BOOL)hasCellularAggregatedDLBW
{
  return self->_cellularAggregatedDLBW != 0;
}

- (BOOL)hasCellularAggregatedULBW
{
  return self->_cellularAggregatedULBW != 0;
}

- (BOOL)hasCellularIssa
{
  return self->_cellularIssa != 0;
}

- (BOOL)hasCellularLac
{
  return self->_cellularLac != 0;
}

- (BOOL)hasCellularLteNrConfiguredBw
{
  return self->_cellularLteNrConfiguredBw != 0;
}

- (BOOL)hasCellularMaxDlMod
{
  return self->_cellularMaxDlMod != 0;
}

- (BOOL)hasCellularMaxNwMimoLyr
{
  return self->_cellularMaxNwMimoLyr != 0;
}

- (BOOL)hasCellularMaxSchdMimoLyr
{
  return self->_cellularMaxSchdMimoLyr != 0;
}

- (BOOL)hasCellularMaxUeRank
{
  return self->_cellularMaxUeRank != 0;
}

- (BOOL)hasCellularMaxUlMod
{
  return self->_cellularMaxUlMod != 0;
}

- (BOOL)hasCellularNrSinr
{
  return self->_cellularNrSinr != 0;
}

- (BOOL)hasCellularNrarfcn
{
  return self->_cellularNrarfcn != 0;
}

- (BOOL)hasCellularRadioFrequency
{
  return self->_cellularRadioFrequency != 0;
}

- (BOOL)hasCellularTotalDlMimoLayers
{
  return self->_cellularTotalDlMimoLayers != 0;
}

- (BOOL)hasCellularTotalNumCcs
{
  return self->_cellularTotalNumCcs != 0;
}

- (BOOL)hasDownloadStartRadioFrequency
{
  return self->_downloadStartRadioFrequency != 0;
}

- (BOOL)hasDownloadEndRadioFrequency
{
  return self->_downloadEndRadioFrequency != 0;
}

- (BOOL)hasNetworkPrimaryIpv6InterfaceName
{
  return self->_networkPrimaryIpv6InterfaceName != 0;
}

- (BOOL)hasNetworkPrimaryIpv6ServiceName
{
  return self->_networkPrimaryIpv6ServiceName != 0;
}

- (BOOL)hasUploadStartRadioFrequency
{
  return self->_uploadStartRadioFrequency != 0;
}

- (BOOL)hasUploadEndRadioFrequency
{
  return self->_uploadEndRadioFrequency != 0;
}

- (BOOL)hasDownloadError
{
  return self->_downloadError != 0;
}

- (BOOL)hasNetworkQualityError
{
  return self->_networkQualityError != 0;
}

- (BOOL)hasNetworkQualityDownloadSpeed
{
  return self->_networkQualityDownloadSpeed != 0;
}

- (BOOL)hasNetworkQualityUploadSpeed
{
  return self->_networkQualityUploadSpeed != 0;
}

- (BOOL)hasNetworkQualityRating
{
  return self->_networkQualityRating != 0;
}

- (BOOL)hasVpnConnectionState
{
  return self->_vpnConnectionState != 0;
}

- (BOOL)hasUploadError
{
  return self->_uploadError != 0;
}

- (BOOL)hasUploadErrorDomain
{
  return self->_uploadErrorDomain != 0;
}

- (BOOL)hasUploadErrorCode
{
  return self->_uploadErrorCode != 0;
}

- (BOOL)hasDownloadErrorDomain
{
  return self->_downloadErrorDomain != 0;
}

- (BOOL)hasDownloadErrorCode
{
  return self->_downloadErrorCode != 0;
}

- (BOOL)hasPingError
{
  return self->_pingError != 0;
}

- (BOOL)hasPingErrorDomain
{
  return self->_pingErrorDomain != 0;
}

- (BOOL)hasPingErrorCode
{
  return self->_pingErrorCode != 0;
}

- (BOOL)hasNetworkQualityErrorDomain
{
  return self->_networkQualityErrorDomain != 0;
}

- (BOOL)hasNetworkQualityErrorCode
{
  return self->_networkQualityErrorCode != 0;
}

- (BOOL)hasCellularRnMobileCountryCode
{
  return self->_cellularRnMobileCountryCode != 0;
}

- (BOOL)hasCellularRnMobileNetworkCode
{
  return self->_cellularRnMobileNetworkCode != 0;
}

- (void)setCellularDataIsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_cellularDataIsEnabled = a3;
}

- (void)setHasCellularDataIsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($0FF3A8E67B3D88A75EBF7BE240CB1B75)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCellularDataIsEnabled
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasDownloadStartCellularEstimate
{
  return self->_downloadStartCellularEstimate != 0;
}

- (BOOL)hasDownloadEndCellularEstimate
{
  return self->_downloadEndCellularEstimate != 0;
}

- (BOOL)hasDownloadMaxCellularEstimate
{
  return self->_downloadMaxCellularEstimate != 0;
}

- (BOOL)hasUploadStartCellularEstimate
{
  return self->_uploadStartCellularEstimate != 0;
}

- (BOOL)hasUploadEndCellularEstimate
{
  return self->_uploadEndCellularEstimate != 0;
}

- (BOOL)hasUploadMaxCellularEstimate
{
  return self->_uploadMaxCellularEstimate != 0;
}

- (BOOL)hasDownloadResponsiveness
{
  return self->_downloadResponsiveness != 0;
}

- (BOOL)hasDownloadResponsivenessConfidence
{
  return self->_downloadResponsivenessConfidence != 0;
}

- (BOOL)hasDownloadResponsivenessRating
{
  return self->_downloadResponsivenessRating != 0;
}

- (BOOL)hasDownloadSpeedConfidence
{
  return self->_downloadSpeedConfidence != 0;
}

- (BOOL)hasDownloadSpeedRating
{
  return self->_downloadSpeedRating != 0;
}

- (BOOL)hasUploadResponsiveness
{
  return self->_uploadResponsiveness != 0;
}

- (BOOL)hasUploadResponsivenessConfidence
{
  return self->_uploadResponsivenessConfidence != 0;
}

- (BOOL)hasUploadResponsivenessRating
{
  return self->_uploadResponsivenessRating != 0;
}

- (BOOL)hasUploadSpeedConfidence
{
  return self->_uploadSpeedConfidence != 0;
}

- (BOOL)hasUploadSpeedRating
{
  return self->_uploadSpeedRating != 0;
}

- (BOOL)hasWifiChannelBand
{
  return self->_wifiChannelBand != 0;
}

- (BOOL)hasWifiChannelWidth
{
  return self->_wifiChannelWidth != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDNetworkPerformanceMetric;
  -[AWDNetworkPerformanceMetric description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDNetworkPerformanceMetric dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has;
  void *v5;
  void *v6;
  NSString *awdlElectionParameters;
  NSString *awdlMasterChannel;
  NSString *awdlOpMode;
  void *v10;
  NSString *awdlSchedule;
  NSString *awdlSecondaryMasterChannel;
  NSString *awdlSyncChannelSequence;
  NSString *awdlSyncState;
  NSString *btConnectedDevicesCount;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v16;
  void *v17;
  NSString *callingClient;
  NSString *cellularActiveContexts;
  void *v20;
  NSString *cellularAttached;
  NSString *cellularBandinfo;
  NSString *cellularBandwidth;
  NSString *cellularCarrierName;
  NSString *cellularDataBearerSoMask;
  NSString *cellularDataBearerTechnology;
  NSString *cellularDataPlanSignalingReductionOverride;
  NSString *cellularDataPossible;
  NSString *cellularInHomeCountry;
  NSString *cellularIndicator;
  NSString *cellularIndicatorOverride;
  NSString *cellularIsoCountryCode;
  NSString *cellularLqm;
  NSString *cellularLteMaxScheduledLayers;
  NSString *cellularMobileCountryCode;
  NSString *cellularMobileNetworkCode;
  NSString *cellularNewRadioCoverage;
  NSString *cellularNewRadioDataBearer;
  NSString *cellularNewRadioMmwaveDataBearer;
  NSString *cellularNewRadioNsaCoverage;
  NSString *cellularNewRadioNsaDataBearer;
  NSString *cellularNewRadioSaCoverage;
  NSString *cellularNewRadioSaDataBearer;
  NSString *cellularNewRadioSub6DataBearer;
  NSString *cellularNrConfiguredBw;
  NSString *cellularNrLayers;
  NSString *cellularNrModulation;
  NSString *cellularNrRsrp;
  NSString *cellularNrRsrq;
  NSString *cellularNrSnr;
  NSString *cellularPid;
  NSString *cellularRadioAccessTechnology;
  NSString *cellularRadioAccessTechnologyCtDataStatus;
  NSString *cellularRoamAllowed;
  NSString *cellularRsrp;
  NSString *cellularSnr;
  NSString *cellularTac;
  NSString *cellularTotalActiveContexts;
  NSString *cellularTotalBw;
  NSString *cellularTotalCcs;
  NSString *cellularTotalLayers;
  NSString *cellularUarfcn;
  NSString *downloadCdnPop;
  NSString *downloadCdnUuid;
  NSString *downloadConnectionTime;
  NSString *downloadDomainLookupTime;
  NSString *downloadEndDataBearerTechnology;
  NSString *downloadEndPrimaryIpv4Interface;
  NSString *downloadEndRat;
  NSString *downloadFileSize;
  NSString *downloadInterfaceName;
  NSString *downloadInterfaceServiceName;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v73;
  void *v74;
  NSString *downloadMaxSpeedObserved;
  NSString *downloadNumberOfStreams;
  NSString *downloadProtocolName;
  NSString *downloadRemoteAddress;
  NSString *downloadRemotePort;
  NSString *downloadRequestTime;
  NSString *downloadRequestToResponseTime;
  NSString *downloadResponseTime;
  NSString *downloadSecureConnectionTime;
  NSString *downloadServer;
  NSString *downloadSpeed;
  NSString *downloadStableSpeed;
  NSString *downloadStartDataBearerTechnology;
  NSString *downloadStartPrimaryIpv4Interface;
  NSString *downloadStartRat;
  void *v90;
  NSString *networkPrimaryIpv4InterfaceName;
  NSString *networkPrimaryIpv4ServiceName;
  NSString *nptkitFrameworkVersion;
  NSString *performanceTestStartTime;
  NSString *pingAddress;
  NSString *pingLossPercent;
  NSString *pingMaxLatency;
  NSString *pingMeanLatency;
  NSString *pingMinLatency;
  NSString *pingStandardDeviation;
  NSString *powerBatteryWarningLevel;
  NSString *powerSourceType;
  NSString *powerStateCaps;
  NSString *systemActiveProcessorCount;
  NSString *systemBatteryLevel;
  NSString *systemBatteryState;
  NSString *systemDeviceClass;
  NSString *systemDeviceModel;
  void *v109;
  NSString *systemName;
  NSString *systemOsVariant;
  NSString *systemPhysicalMemory;
  void *v113;
  NSString *systemProcessorCount;
  NSString *systemVersion;
  NSString *uploadCdnPop;
  NSString *uploadCdnUuid;
  NSString *uploadConnectionTime;
  NSString *uploadDomainLookupTime;
  NSString *uploadEndDataBearerTechnology;
  NSString *uploadEndPrimaryIpv4Interface;
  NSString *uploadEndRat;
  NSString *uploadFileSize;
  NSString *uploadInterfaceName;
  NSString *uploadInterfaceServiceName;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v126;
  void *v127;
  NSString *uploadMaxSpeedObserved;
  NSString *uploadNumberOfStreams;
  NSString *uploadProtocolName;
  NSString *uploadRemoteAddress;
  NSString *uploadRemotePort;
  NSString *uploadRequestTime;
  NSString *uploadRequestToResponseTime;
  NSString *uploadResponseTime;
  NSString *uploadSecureConnectionTime;
  NSString *uploadServer;
  NSString *uploadSpeed;
  NSString *uploadStableSpeed;
  NSString *uploadStartDataBearerTechnology;
  NSString *uploadStartPrimaryIpv4Interface;
  NSString *uploadStartRat;
  void *v143;
  NSString *wifiAveragePhyRateRx;
  NSString *wifiAverageRssi;
  NSString *wifiAverageSnr;
  NSString *wifiAverageTcpRtt;
  NSString *wifiBtcMode;
  NSString *wifiCca;
  NSString *wifiChannel;
  NSString *wifiCwfCca;
  NSString *wifiEapolControlMode;
  NSString *wifiEapolSupplicantState;
  NSString *wifiGuardInterval;
  NSString *wifiHiddenState;
  void *v156;
  NSString *wifiMcsIndex;
  NSString *wifiNoise;
  NSString *wifiNumberOfSpatialStreams;
  NSString *wifiOpMode;
  NSString *wifiPhyMode;
  NSString *wifiRssi;
  NSString *wifiSecurity;
  NSString *wifiTxRate;
  NSString *wrmChannelType;
  NSString *cellularCellid;
  NSString *networkQualityResponsiveness;
  NSString *cellularAggregatedDLBW;
  NSString *cellularAggregatedULBW;
  NSString *cellularIssa;
  NSString *cellularLac;
  NSString *cellularLteNrConfiguredBw;
  NSString *cellularMaxDlMod;
  NSString *cellularMaxNwMimoLyr;
  NSString *cellularMaxSchdMimoLyr;
  NSString *cellularMaxUeRank;
  NSString *cellularMaxUlMod;
  NSString *cellularNrSinr;
  NSString *cellularNrarfcn;
  NSString *cellularRadioFrequency;
  NSString *cellularTotalDlMimoLayers;
  NSString *cellularTotalNumCcs;
  NSString *downloadStartRadioFrequency;
  NSString *downloadEndRadioFrequency;
  NSString *networkPrimaryIpv6InterfaceName;
  NSString *networkPrimaryIpv6ServiceName;
  NSString *uploadStartRadioFrequency;
  NSString *uploadEndRadioFrequency;
  NSString *downloadError;
  NSString *networkQualityError;
  NSString *networkQualityDownloadSpeed;
  NSString *networkQualityUploadSpeed;
  NSString *networkQualityRating;
  NSString *vpnConnectionState;
  NSString *uploadError;
  NSString *uploadErrorDomain;
  NSString *uploadErrorCode;
  NSString *downloadErrorDomain;
  NSString *downloadErrorCode;
  NSString *pingError;
  NSString *pingErrorDomain;
  NSString *pingErrorCode;
  NSString *networkQualityErrorDomain;
  NSString *networkQualityErrorCode;
  NSString *cellularRnMobileCountryCode;
  NSString *cellularRnMobileNetworkCode;
  void *v207;
  NSString *downloadStartCellularEstimate;
  NSString *downloadEndCellularEstimate;
  NSString *downloadMaxCellularEstimate;
  NSString *uploadStartCellularEstimate;
  NSString *uploadEndCellularEstimate;
  NSString *uploadMaxCellularEstimate;
  NSString *downloadResponsiveness;
  NSString *downloadResponsivenessConfidence;
  NSString *downloadResponsivenessRating;
  NSString *downloadSpeedConfidence;
  NSString *downloadSpeedRating;
  NSString *uploadResponsiveness;
  NSString *uploadResponsivenessConfidence;
  NSString *uploadResponsivenessRating;
  NSString *uploadSpeedConfidence;
  NSString *uploadSpeedRating;
  NSString *wifiChannelBand;
  NSString *wifiChannelWidth;
  id v226;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_acceptablePerformanceResult);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("acceptable_performance_result"));

  }
  awdlElectionParameters = self->_awdlElectionParameters;
  if (awdlElectionParameters)
    objc_msgSend(v3, "setObject:forKey:", awdlElectionParameters, CFSTR("awdl_election_parameters"));
  awdlMasterChannel = self->_awdlMasterChannel;
  if (awdlMasterChannel)
    objc_msgSend(v3, "setObject:forKey:", awdlMasterChannel, CFSTR("awdl_master_channel"));
  awdlOpMode = self->_awdlOpMode;
  if (awdlOpMode)
    objc_msgSend(v3, "setObject:forKey:", awdlOpMode, CFSTR("awdl_op_mode"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_awdlPowerState);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("awdl_power_state"));

  }
  awdlSchedule = self->_awdlSchedule;
  if (awdlSchedule)
    objc_msgSend(v3, "setObject:forKey:", awdlSchedule, CFSTR("awdl_schedule"));
  awdlSecondaryMasterChannel = self->_awdlSecondaryMasterChannel;
  if (awdlSecondaryMasterChannel)
    objc_msgSend(v3, "setObject:forKey:", awdlSecondaryMasterChannel, CFSTR("awdl_secondary_master_channel"));
  awdlSyncChannelSequence = self->_awdlSyncChannelSequence;
  if (awdlSyncChannelSequence)
    objc_msgSend(v3, "setObject:forKey:", awdlSyncChannelSequence, CFSTR("awdl_sync_channel_sequence"));
  awdlSyncState = self->_awdlSyncState;
  if (awdlSyncState)
    objc_msgSend(v3, "setObject:forKey:", awdlSyncState, CFSTR("awdl_sync_state"));
  btConnectedDevicesCount = self->_btConnectedDevicesCount;
  if (btConnectedDevicesCount)
    objc_msgSend(v3, "setObject:forKey:", btConnectedDevicesCount, CFSTR("bt_connected_devices_count"));
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_btIsConnectable);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v228, CFSTR("bt_is_connectable"));

    v16 = self->_has;
    if ((*(_BYTE *)&v16 & 0x10) == 0)
    {
LABEL_25:
      if ((*(_BYTE *)&v16 & 0x20) == 0)
        goto LABEL_26;
      goto LABEL_453;
    }
  }
  else if ((*(_BYTE *)&v16 & 0x10) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_btIsDiscoverable);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v229, CFSTR("bt_is_discoverable"));

  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v16 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_453:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_btIsPowerOn);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v230, CFSTR("bt_is_power_on"));

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_btIsScanning);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("bt_is_scanning"));

  }
LABEL_28:
  callingClient = self->_callingClient;
  if (callingClient)
    objc_msgSend(v3, "setObject:forKey:", callingClient, CFSTR("calling_client"));
  cellularActiveContexts = self->_cellularActiveContexts;
  if (cellularActiveContexts)
    objc_msgSend(v3, "setObject:forKey:", cellularActiveContexts, CFSTR("cellular_active_contexts"));
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellularAllowsVoip);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("cellular_allows_voip"));

  }
  cellularAttached = self->_cellularAttached;
  if (cellularAttached)
    objc_msgSend(v3, "setObject:forKey:", cellularAttached, CFSTR("cellular_attached"));
  cellularBandinfo = self->_cellularBandinfo;
  if (cellularBandinfo)
    objc_msgSend(v3, "setObject:forKey:", cellularBandinfo, CFSTR("cellular_bandinfo"));
  cellularBandwidth = self->_cellularBandwidth;
  if (cellularBandwidth)
    objc_msgSend(v3, "setObject:forKey:", cellularBandwidth, CFSTR("cellular_bandwidth"));
  cellularCarrierName = self->_cellularCarrierName;
  if (cellularCarrierName)
    objc_msgSend(v3, "setObject:forKey:", cellularCarrierName, CFSTR("cellular_carrier_name"));
  cellularDataBearerSoMask = self->_cellularDataBearerSoMask;
  if (cellularDataBearerSoMask)
    objc_msgSend(v3, "setObject:forKey:", cellularDataBearerSoMask, CFSTR("cellular_data_bearer_so_mask"));
  cellularDataBearerTechnology = self->_cellularDataBearerTechnology;
  if (cellularDataBearerTechnology)
    objc_msgSend(v3, "setObject:forKey:", cellularDataBearerTechnology, CFSTR("cellular_data_bearer_technology"));
  cellularDataPlanSignalingReductionOverride = self->_cellularDataPlanSignalingReductionOverride;
  if (cellularDataPlanSignalingReductionOverride)
    objc_msgSend(v3, "setObject:forKey:", cellularDataPlanSignalingReductionOverride, CFSTR("cellular_data_plan_signaling_reduction_override"));
  cellularDataPossible = self->_cellularDataPossible;
  if (cellularDataPossible)
    objc_msgSend(v3, "setObject:forKey:", cellularDataPossible, CFSTR("cellular_data_possible"));
  cellularInHomeCountry = self->_cellularInHomeCountry;
  if (cellularInHomeCountry)
    objc_msgSend(v3, "setObject:forKey:", cellularInHomeCountry, CFSTR("cellular_in_home_country"));
  cellularIndicator = self->_cellularIndicator;
  if (cellularIndicator)
    objc_msgSend(v3, "setObject:forKey:", cellularIndicator, CFSTR("cellular_indicator"));
  cellularIndicatorOverride = self->_cellularIndicatorOverride;
  if (cellularIndicatorOverride)
    objc_msgSend(v3, "setObject:forKey:", cellularIndicatorOverride, CFSTR("cellular_indicator_override"));
  cellularIsoCountryCode = self->_cellularIsoCountryCode;
  if (cellularIsoCountryCode)
    objc_msgSend(v3, "setObject:forKey:", cellularIsoCountryCode, CFSTR("cellular_iso_country_code"));
  cellularLqm = self->_cellularLqm;
  if (cellularLqm)
    objc_msgSend(v3, "setObject:forKey:", cellularLqm, CFSTR("cellular_lqm"));
  cellularLteMaxScheduledLayers = self->_cellularLteMaxScheduledLayers;
  if (cellularLteMaxScheduledLayers)
    objc_msgSend(v3, "setObject:forKey:", cellularLteMaxScheduledLayers, CFSTR("cellular_lte_max_scheduled_layers"));
  cellularMobileCountryCode = self->_cellularMobileCountryCode;
  if (cellularMobileCountryCode)
    objc_msgSend(v3, "setObject:forKey:", cellularMobileCountryCode, CFSTR("cellular_mobile_country_code"));
  cellularMobileNetworkCode = self->_cellularMobileNetworkCode;
  if (cellularMobileNetworkCode)
    objc_msgSend(v3, "setObject:forKey:", cellularMobileNetworkCode, CFSTR("cellular_mobile_network_code"));
  cellularNewRadioCoverage = self->_cellularNewRadioCoverage;
  if (cellularNewRadioCoverage)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioCoverage, CFSTR("cellular_new_radio_coverage"));
  cellularNewRadioDataBearer = self->_cellularNewRadioDataBearer;
  if (cellularNewRadioDataBearer)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioDataBearer, CFSTR("cellular_new_radio_data_bearer"));
  cellularNewRadioMmwaveDataBearer = self->_cellularNewRadioMmwaveDataBearer;
  if (cellularNewRadioMmwaveDataBearer)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioMmwaveDataBearer, CFSTR("cellular_new_radio_mmwave_data_bearer"));
  cellularNewRadioNsaCoverage = self->_cellularNewRadioNsaCoverage;
  if (cellularNewRadioNsaCoverage)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioNsaCoverage, CFSTR("cellular_new_radio_nsa_coverage"));
  cellularNewRadioNsaDataBearer = self->_cellularNewRadioNsaDataBearer;
  if (cellularNewRadioNsaDataBearer)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioNsaDataBearer, CFSTR("cellular_new_radio_nsa_data_bearer"));
  cellularNewRadioSaCoverage = self->_cellularNewRadioSaCoverage;
  if (cellularNewRadioSaCoverage)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioSaCoverage, CFSTR("cellular_new_radio_sa_coverage"));
  cellularNewRadioSaDataBearer = self->_cellularNewRadioSaDataBearer;
  if (cellularNewRadioSaDataBearer)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioSaDataBearer, CFSTR("cellular_new_radio_sa_data_bearer"));
  cellularNewRadioSub6DataBearer = self->_cellularNewRadioSub6DataBearer;
  if (cellularNewRadioSub6DataBearer)
    objc_msgSend(v3, "setObject:forKey:", cellularNewRadioSub6DataBearer, CFSTR("cellular_new_radio_sub6_data_bearer"));
  cellularNrConfiguredBw = self->_cellularNrConfiguredBw;
  if (cellularNrConfiguredBw)
    objc_msgSend(v3, "setObject:forKey:", cellularNrConfiguredBw, CFSTR("cellular_nr_configured_bw"));
  cellularNrLayers = self->_cellularNrLayers;
  if (cellularNrLayers)
    objc_msgSend(v3, "setObject:forKey:", cellularNrLayers, CFSTR("cellular_nr_layers"));
  cellularNrModulation = self->_cellularNrModulation;
  if (cellularNrModulation)
    objc_msgSend(v3, "setObject:forKey:", cellularNrModulation, CFSTR("cellular_nr_modulation"));
  cellularNrRsrp = self->_cellularNrRsrp;
  if (cellularNrRsrp)
    objc_msgSend(v3, "setObject:forKey:", cellularNrRsrp, CFSTR("cellular_nr_rsrp"));
  cellularNrRsrq = self->_cellularNrRsrq;
  if (cellularNrRsrq)
    objc_msgSend(v3, "setObject:forKey:", cellularNrRsrq, CFSTR("cellular_nr_rsrq"));
  cellularNrSnr = self->_cellularNrSnr;
  if (cellularNrSnr)
    objc_msgSend(v3, "setObject:forKey:", cellularNrSnr, CFSTR("cellular_nr_snr"));
  cellularPid = self->_cellularPid;
  if (cellularPid)
    objc_msgSend(v3, "setObject:forKey:", cellularPid, CFSTR("cellular_pid"));
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology)
    objc_msgSend(v3, "setObject:forKey:", cellularRadioAccessTechnology, CFSTR("cellular_radio_access_technology"));
  cellularRadioAccessTechnologyCtDataStatus = self->_cellularRadioAccessTechnologyCtDataStatus;
  if (cellularRadioAccessTechnologyCtDataStatus)
    objc_msgSend(v3, "setObject:forKey:", cellularRadioAccessTechnologyCtDataStatus, CFSTR("cellular_radio_access_technology_ct_data_status"));
  cellularRoamAllowed = self->_cellularRoamAllowed;
  if (cellularRoamAllowed)
    objc_msgSend(v3, "setObject:forKey:", cellularRoamAllowed, CFSTR("cellular_roam_allowed"));
  cellularRsrp = self->_cellularRsrp;
  if (cellularRsrp)
    objc_msgSend(v3, "setObject:forKey:", cellularRsrp, CFSTR("cellular_rsrp"));
  cellularSnr = self->_cellularSnr;
  if (cellularSnr)
    objc_msgSend(v3, "setObject:forKey:", cellularSnr, CFSTR("cellular_snr"));
  cellularTac = self->_cellularTac;
  if (cellularTac)
    objc_msgSend(v3, "setObject:forKey:", cellularTac, CFSTR("cellular_tac"));
  cellularTotalActiveContexts = self->_cellularTotalActiveContexts;
  if (cellularTotalActiveContexts)
    objc_msgSend(v3, "setObject:forKey:", cellularTotalActiveContexts, CFSTR("cellular_total_active_contexts"));
  cellularTotalBw = self->_cellularTotalBw;
  if (cellularTotalBw)
    objc_msgSend(v3, "setObject:forKey:", cellularTotalBw, CFSTR("cellular_total_bw"));
  cellularTotalCcs = self->_cellularTotalCcs;
  if (cellularTotalCcs)
    objc_msgSend(v3, "setObject:forKey:", cellularTotalCcs, CFSTR("cellular_total_ccs"));
  cellularTotalLayers = self->_cellularTotalLayers;
  if (cellularTotalLayers)
    objc_msgSend(v3, "setObject:forKey:", cellularTotalLayers, CFSTR("cellular_total_layers"));
  cellularUarfcn = self->_cellularUarfcn;
  if (cellularUarfcn)
    objc_msgSend(v3, "setObject:forKey:", cellularUarfcn, CFSTR("cellular_uarfcn"));
  downloadCdnPop = self->_downloadCdnPop;
  if (downloadCdnPop)
    objc_msgSend(v3, "setObject:forKey:", downloadCdnPop, CFSTR("download_cdn_pop"));
  downloadCdnUuid = self->_downloadCdnUuid;
  if (downloadCdnUuid)
    objc_msgSend(v3, "setObject:forKey:", downloadCdnUuid, CFSTR("download_cdn_uuid"));
  downloadConnectionTime = self->_downloadConnectionTime;
  if (downloadConnectionTime)
    objc_msgSend(v3, "setObject:forKey:", downloadConnectionTime, CFSTR("download_connection_time"));
  downloadDomainLookupTime = self->_downloadDomainLookupTime;
  if (downloadDomainLookupTime)
    objc_msgSend(v3, "setObject:forKey:", downloadDomainLookupTime, CFSTR("download_domain_lookup_time"));
  downloadEndDataBearerTechnology = self->_downloadEndDataBearerTechnology;
  if (downloadEndDataBearerTechnology)
    objc_msgSend(v3, "setObject:forKey:", downloadEndDataBearerTechnology, CFSTR("download_end_data_bearer_technology"));
  downloadEndPrimaryIpv4Interface = self->_downloadEndPrimaryIpv4Interface;
  if (downloadEndPrimaryIpv4Interface)
    objc_msgSend(v3, "setObject:forKey:", downloadEndPrimaryIpv4Interface, CFSTR("download_end_primary_ipv4_interface"));
  downloadEndRat = self->_downloadEndRat;
  if (downloadEndRat)
    objc_msgSend(v3, "setObject:forKey:", downloadEndRat, CFSTR("download_end_rat"));
  downloadFileSize = self->_downloadFileSize;
  if (downloadFileSize)
    objc_msgSend(v3, "setObject:forKey:", downloadFileSize, CFSTR("download_file_size"));
  downloadInterfaceName = self->_downloadInterfaceName;
  if (downloadInterfaceName)
    objc_msgSend(v3, "setObject:forKey:", downloadInterfaceName, CFSTR("download_interface_name"));
  downloadInterfaceServiceName = self->_downloadInterfaceServiceName;
  if (downloadInterfaceServiceName)
    objc_msgSend(v3, "setObject:forKey:", downloadInterfaceServiceName, CFSTR("download_interface_service_name"));
  v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadIsCellular);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v231, CFSTR("download_is_cellular"));

    v73 = self->_has;
    if ((*(_WORD *)&v73 & 0x400) == 0)
    {
LABEL_140:
      if ((*(_WORD *)&v73 & 0x800) == 0)
        goto LABEL_141;
      goto LABEL_457;
    }
  }
  else if ((*(_WORD *)&v73 & 0x400) == 0)
  {
    goto LABEL_140;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadIsConstrained);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v232, CFSTR("download_is_constrained"));

  v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x800) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v73 & 0x1000) == 0)
      goto LABEL_142;
    goto LABEL_458;
  }
LABEL_457:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadIsExpensive);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v233, CFSTR("download_is_expensive"));

  v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x1000) == 0)
  {
LABEL_142:
    if ((*(_WORD *)&v73 & 0x2000) == 0)
      goto LABEL_143;
    goto LABEL_459;
  }
LABEL_458:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadIsMultipath);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v234, CFSTR("download_is_multipath"));

  v73 = self->_has;
  if ((*(_WORD *)&v73 & 0x2000) == 0)
  {
LABEL_143:
    if ((*(_WORD *)&v73 & 0x4000) == 0)
      goto LABEL_145;
    goto LABEL_144;
  }
LABEL_459:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadIsProxyConnection);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v235, CFSTR("download_is_proxy_connection"));

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_144:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadIsReusedConnection);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("download_is_reused_connection"));

  }
LABEL_145:
  downloadMaxSpeedObserved = self->_downloadMaxSpeedObserved;
  if (downloadMaxSpeedObserved)
    objc_msgSend(v3, "setObject:forKey:", downloadMaxSpeedObserved, CFSTR("download_max_speed_observed"));
  downloadNumberOfStreams = self->_downloadNumberOfStreams;
  if (downloadNumberOfStreams)
    objc_msgSend(v3, "setObject:forKey:", downloadNumberOfStreams, CFSTR("download_number_of_streams"));
  downloadProtocolName = self->_downloadProtocolName;
  if (downloadProtocolName)
    objc_msgSend(v3, "setObject:forKey:", downloadProtocolName, CFSTR("download_protocol_name"));
  downloadRemoteAddress = self->_downloadRemoteAddress;
  if (downloadRemoteAddress)
    objc_msgSend(v3, "setObject:forKey:", downloadRemoteAddress, CFSTR("download_remote_address"));
  downloadRemotePort = self->_downloadRemotePort;
  if (downloadRemotePort)
    objc_msgSend(v3, "setObject:forKey:", downloadRemotePort, CFSTR("download_remote_port"));
  downloadRequestTime = self->_downloadRequestTime;
  if (downloadRequestTime)
    objc_msgSend(v3, "setObject:forKey:", downloadRequestTime, CFSTR("download_request_time"));
  downloadRequestToResponseTime = self->_downloadRequestToResponseTime;
  if (downloadRequestToResponseTime)
    objc_msgSend(v3, "setObject:forKey:", downloadRequestToResponseTime, CFSTR("download_request_to_response_time"));
  downloadResponseTime = self->_downloadResponseTime;
  if (downloadResponseTime)
    objc_msgSend(v3, "setObject:forKey:", downloadResponseTime, CFSTR("download_response_time"));
  downloadSecureConnectionTime = self->_downloadSecureConnectionTime;
  if (downloadSecureConnectionTime)
    objc_msgSend(v3, "setObject:forKey:", downloadSecureConnectionTime, CFSTR("download_secure_connection_time"));
  downloadServer = self->_downloadServer;
  if (downloadServer)
    objc_msgSend(v3, "setObject:forKey:", downloadServer, CFSTR("download_server"));
  downloadSpeed = self->_downloadSpeed;
  if (downloadSpeed)
    objc_msgSend(v3, "setObject:forKey:", downloadSpeed, CFSTR("download_speed"));
  downloadStableSpeed = self->_downloadStableSpeed;
  if (downloadStableSpeed)
    objc_msgSend(v3, "setObject:forKey:", downloadStableSpeed, CFSTR("download_stable_speed"));
  downloadStartDataBearerTechnology = self->_downloadStartDataBearerTechnology;
  if (downloadStartDataBearerTechnology)
    objc_msgSend(v3, "setObject:forKey:", downloadStartDataBearerTechnology, CFSTR("download_start_data_bearer_technology"));
  downloadStartPrimaryIpv4Interface = self->_downloadStartPrimaryIpv4Interface;
  if (downloadStartPrimaryIpv4Interface)
    objc_msgSend(v3, "setObject:forKey:", downloadStartPrimaryIpv4Interface, CFSTR("download_start_primary_ipv4_interface"));
  downloadStartRat = self->_downloadStartRat;
  if (downloadStartRat)
    objc_msgSend(v3, "setObject:forKey:", downloadStartRat, CFSTR("download_start_rat"));
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_networkIsAppleReachable);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("network_is_apple_reachable"));

  }
  networkPrimaryIpv4InterfaceName = self->_networkPrimaryIpv4InterfaceName;
  if (networkPrimaryIpv4InterfaceName)
    objc_msgSend(v3, "setObject:forKey:", networkPrimaryIpv4InterfaceName, CFSTR("network_primary_ipv4_interface_name"));
  networkPrimaryIpv4ServiceName = self->_networkPrimaryIpv4ServiceName;
  if (networkPrimaryIpv4ServiceName)
    objc_msgSend(v3, "setObject:forKey:", networkPrimaryIpv4ServiceName, CFSTR("network_primary_ipv4_service_name"));
  nptkitFrameworkVersion = self->_nptkitFrameworkVersion;
  if (nptkitFrameworkVersion)
    objc_msgSend(v3, "setObject:forKey:", nptkitFrameworkVersion, CFSTR("nptkit_framework_version"));
  performanceTestStartTime = self->_performanceTestStartTime;
  if (performanceTestStartTime)
    objc_msgSend(v3, "setObject:forKey:", performanceTestStartTime, CFSTR("performance_test_start_time"));
  pingAddress = self->_pingAddress;
  if (pingAddress)
    objc_msgSend(v3, "setObject:forKey:", pingAddress, CFSTR("ping_address"));
  pingLossPercent = self->_pingLossPercent;
  if (pingLossPercent)
    objc_msgSend(v3, "setObject:forKey:", pingLossPercent, CFSTR("ping_loss_percent"));
  pingMaxLatency = self->_pingMaxLatency;
  if (pingMaxLatency)
    objc_msgSend(v3, "setObject:forKey:", pingMaxLatency, CFSTR("ping_max_latency"));
  pingMeanLatency = self->_pingMeanLatency;
  if (pingMeanLatency)
    objc_msgSend(v3, "setObject:forKey:", pingMeanLatency, CFSTR("ping_mean_latency"));
  pingMinLatency = self->_pingMinLatency;
  if (pingMinLatency)
    objc_msgSend(v3, "setObject:forKey:", pingMinLatency, CFSTR("ping_min_latency"));
  pingStandardDeviation = self->_pingStandardDeviation;
  if (pingStandardDeviation)
    objc_msgSend(v3, "setObject:forKey:", pingStandardDeviation, CFSTR("ping_standard_deviation"));
  powerBatteryWarningLevel = self->_powerBatteryWarningLevel;
  if (powerBatteryWarningLevel)
    objc_msgSend(v3, "setObject:forKey:", powerBatteryWarningLevel, CFSTR("power_battery_warning_level"));
  powerSourceType = self->_powerSourceType;
  if (powerSourceType)
    objc_msgSend(v3, "setObject:forKey:", powerSourceType, CFSTR("power_source_type"));
  powerStateCaps = self->_powerStateCaps;
  if (powerStateCaps)
    objc_msgSend(v3, "setObject:forKey:", powerStateCaps, CFSTR("power_state_caps"));
  systemActiveProcessorCount = self->_systemActiveProcessorCount;
  if (systemActiveProcessorCount)
    objc_msgSend(v3, "setObject:forKey:", systemActiveProcessorCount, CFSTR("system_active_processor_count"));
  systemBatteryLevel = self->_systemBatteryLevel;
  if (systemBatteryLevel)
    objc_msgSend(v3, "setObject:forKey:", systemBatteryLevel, CFSTR("system_battery_level"));
  systemBatteryState = self->_systemBatteryState;
  if (systemBatteryState)
    objc_msgSend(v3, "setObject:forKey:", systemBatteryState, CFSTR("system_battery_state"));
  systemDeviceClass = self->_systemDeviceClass;
  if (systemDeviceClass)
    objc_msgSend(v3, "setObject:forKey:", systemDeviceClass, CFSTR("system_device_class"));
  systemDeviceModel = self->_systemDeviceModel;
  if (systemDeviceModel)
    objc_msgSend(v3, "setObject:forKey:", systemDeviceModel, CFSTR("system_device_model"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_systemLowPowerModeEnabled);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("system_low_power_mode_enabled"));

  }
  systemName = self->_systemName;
  if (systemName)
    objc_msgSend(v3, "setObject:forKey:", systemName, CFSTR("system_name"));
  systemOsVariant = self->_systemOsVariant;
  if (systemOsVariant)
    objc_msgSend(v3, "setObject:forKey:", systemOsVariant, CFSTR("system_os_variant"));
  systemPhysicalMemory = self->_systemPhysicalMemory;
  if (systemPhysicalMemory)
    objc_msgSend(v3, "setObject:forKey:", systemPhysicalMemory, CFSTR("system_physical_memory"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_systemPowersourceConnected);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("system_powersource_connected"));

  }
  systemProcessorCount = self->_systemProcessorCount;
  if (systemProcessorCount)
    objc_msgSend(v3, "setObject:forKey:", systemProcessorCount, CFSTR("system_processor_count"));
  systemVersion = self->_systemVersion;
  if (systemVersion)
    objc_msgSend(v3, "setObject:forKey:", systemVersion, CFSTR("system_version"));
  uploadCdnPop = self->_uploadCdnPop;
  if (uploadCdnPop)
    objc_msgSend(v3, "setObject:forKey:", uploadCdnPop, CFSTR("upload_cdn_pop"));
  uploadCdnUuid = self->_uploadCdnUuid;
  if (uploadCdnUuid)
    objc_msgSend(v3, "setObject:forKey:", uploadCdnUuid, CFSTR("upload_cdn_uuid"));
  uploadConnectionTime = self->_uploadConnectionTime;
  if (uploadConnectionTime)
    objc_msgSend(v3, "setObject:forKey:", uploadConnectionTime, CFSTR("upload_connection_time"));
  uploadDomainLookupTime = self->_uploadDomainLookupTime;
  if (uploadDomainLookupTime)
    objc_msgSend(v3, "setObject:forKey:", uploadDomainLookupTime, CFSTR("upload_domain_lookup_time"));
  uploadEndDataBearerTechnology = self->_uploadEndDataBearerTechnology;
  if (uploadEndDataBearerTechnology)
    objc_msgSend(v3, "setObject:forKey:", uploadEndDataBearerTechnology, CFSTR("upload_end_data_bearer_technology"));
  uploadEndPrimaryIpv4Interface = self->_uploadEndPrimaryIpv4Interface;
  if (uploadEndPrimaryIpv4Interface)
    objc_msgSend(v3, "setObject:forKey:", uploadEndPrimaryIpv4Interface, CFSTR("upload_end_primary_ipv4_interface"));
  uploadEndRat = self->_uploadEndRat;
  if (uploadEndRat)
    objc_msgSend(v3, "setObject:forKey:", uploadEndRat, CFSTR("upload_end_rat"));
  uploadFileSize = self->_uploadFileSize;
  if (uploadFileSize)
    objc_msgSend(v3, "setObject:forKey:", uploadFileSize, CFSTR("upload_file_size"));
  uploadInterfaceName = self->_uploadInterfaceName;
  if (uploadInterfaceName)
    objc_msgSend(v3, "setObject:forKey:", uploadInterfaceName, CFSTR("upload_interface_name"));
  uploadInterfaceServiceName = self->_uploadInterfaceServiceName;
  if (uploadInterfaceServiceName)
    objc_msgSend(v3, "setObject:forKey:", uploadInterfaceServiceName, CFSTR("upload_interface_service_name"));
  v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uploadIsCellular);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v236, CFSTR("upload_is_cellular"));

    v126 = self->_has;
    if ((*(_DWORD *)&v126 & 0x80000) == 0)
    {
LABEL_249:
      if ((*(_DWORD *)&v126 & 0x100000) == 0)
        goto LABEL_250;
      goto LABEL_463;
    }
  }
  else if ((*(_DWORD *)&v126 & 0x80000) == 0)
  {
    goto LABEL_249;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uploadIsConstrained);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v237, CFSTR("upload_is_constrained"));

  v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x100000) == 0)
  {
LABEL_250:
    if ((*(_DWORD *)&v126 & 0x200000) == 0)
      goto LABEL_251;
    goto LABEL_464;
  }
LABEL_463:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uploadIsExpensive);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v238, CFSTR("upload_is_expensive"));

  v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x200000) == 0)
  {
LABEL_251:
    if ((*(_DWORD *)&v126 & 0x400000) == 0)
      goto LABEL_252;
    goto LABEL_465;
  }
LABEL_464:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uploadIsMultipath);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v239, CFSTR("upload_is_multipath"));

  v126 = self->_has;
  if ((*(_DWORD *)&v126 & 0x400000) == 0)
  {
LABEL_252:
    if ((*(_DWORD *)&v126 & 0x800000) == 0)
      goto LABEL_254;
    goto LABEL_253;
  }
LABEL_465:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uploadIsProxyConnection);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v240, CFSTR("upload_is_proxy_connection"));

  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_253:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uploadIsReusedConnection);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("upload_is_reused_connection"));

  }
LABEL_254:
  uploadMaxSpeedObserved = self->_uploadMaxSpeedObserved;
  if (uploadMaxSpeedObserved)
    objc_msgSend(v3, "setObject:forKey:", uploadMaxSpeedObserved, CFSTR("upload_max_speed_observed"));
  uploadNumberOfStreams = self->_uploadNumberOfStreams;
  if (uploadNumberOfStreams)
    objc_msgSend(v3, "setObject:forKey:", uploadNumberOfStreams, CFSTR("upload_number_of_streams"));
  uploadProtocolName = self->_uploadProtocolName;
  if (uploadProtocolName)
    objc_msgSend(v3, "setObject:forKey:", uploadProtocolName, CFSTR("upload_protocol_name"));
  uploadRemoteAddress = self->_uploadRemoteAddress;
  if (uploadRemoteAddress)
    objc_msgSend(v3, "setObject:forKey:", uploadRemoteAddress, CFSTR("upload_remote_address"));
  uploadRemotePort = self->_uploadRemotePort;
  if (uploadRemotePort)
    objc_msgSend(v3, "setObject:forKey:", uploadRemotePort, CFSTR("upload_remote_port"));
  uploadRequestTime = self->_uploadRequestTime;
  if (uploadRequestTime)
    objc_msgSend(v3, "setObject:forKey:", uploadRequestTime, CFSTR("upload_request_time"));
  uploadRequestToResponseTime = self->_uploadRequestToResponseTime;
  if (uploadRequestToResponseTime)
    objc_msgSend(v3, "setObject:forKey:", uploadRequestToResponseTime, CFSTR("upload_request_to_response_time"));
  uploadResponseTime = self->_uploadResponseTime;
  if (uploadResponseTime)
    objc_msgSend(v3, "setObject:forKey:", uploadResponseTime, CFSTR("upload_response_time"));
  uploadSecureConnectionTime = self->_uploadSecureConnectionTime;
  if (uploadSecureConnectionTime)
    objc_msgSend(v3, "setObject:forKey:", uploadSecureConnectionTime, CFSTR("upload_secure_connection_time"));
  uploadServer = self->_uploadServer;
  if (uploadServer)
    objc_msgSend(v3, "setObject:forKey:", uploadServer, CFSTR("upload_server"));
  uploadSpeed = self->_uploadSpeed;
  if (uploadSpeed)
    objc_msgSend(v3, "setObject:forKey:", uploadSpeed, CFSTR("upload_speed"));
  uploadStableSpeed = self->_uploadStableSpeed;
  if (uploadStableSpeed)
    objc_msgSend(v3, "setObject:forKey:", uploadStableSpeed, CFSTR("upload_stable_speed"));
  uploadStartDataBearerTechnology = self->_uploadStartDataBearerTechnology;
  if (uploadStartDataBearerTechnology)
    objc_msgSend(v3, "setObject:forKey:", uploadStartDataBearerTechnology, CFSTR("upload_start_data_bearer_technology"));
  uploadStartPrimaryIpv4Interface = self->_uploadStartPrimaryIpv4Interface;
  if (uploadStartPrimaryIpv4Interface)
    objc_msgSend(v3, "setObject:forKey:", uploadStartPrimaryIpv4Interface, CFSTR("upload_start_primary_ipv4_interface"));
  uploadStartRat = self->_uploadStartRat;
  if (uploadStartRat)
    objc_msgSend(v3, "setObject:forKey:", uploadStartRat, CFSTR("upload_start_rat"));
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useWifiWasSpecified);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v143, CFSTR("use_wifi_was_specified"));

  }
  wifiAveragePhyRateRx = self->_wifiAveragePhyRateRx;
  if (wifiAveragePhyRateRx)
    objc_msgSend(v3, "setObject:forKey:", wifiAveragePhyRateRx, CFSTR("wifi_average_phy_rate_rx"));
  wifiAverageRssi = self->_wifiAverageRssi;
  if (wifiAverageRssi)
    objc_msgSend(v3, "setObject:forKey:", wifiAverageRssi, CFSTR("wifi_average_rssi"));
  wifiAverageSnr = self->_wifiAverageSnr;
  if (wifiAverageSnr)
    objc_msgSend(v3, "setObject:forKey:", wifiAverageSnr, CFSTR("wifi_average_snr"));
  wifiAverageTcpRtt = self->_wifiAverageTcpRtt;
  if (wifiAverageTcpRtt)
    objc_msgSend(v3, "setObject:forKey:", wifiAverageTcpRtt, CFSTR("wifi_average_tcp_rtt"));
  wifiBtcMode = self->_wifiBtcMode;
  if (wifiBtcMode)
    objc_msgSend(v3, "setObject:forKey:", wifiBtcMode, CFSTR("wifi_btc_mode"));
  wifiCca = self->_wifiCca;
  if (wifiCca)
    objc_msgSend(v3, "setObject:forKey:", wifiCca, CFSTR("wifi_cca"));
  wifiChannel = self->_wifiChannel;
  if (wifiChannel)
    objc_msgSend(v3, "setObject:forKey:", wifiChannel, CFSTR("wifi_channel"));
  wifiCwfCca = self->_wifiCwfCca;
  if (wifiCwfCca)
    objc_msgSend(v3, "setObject:forKey:", wifiCwfCca, CFSTR("wifi_cwf_cca"));
  wifiEapolControlMode = self->_wifiEapolControlMode;
  if (wifiEapolControlMode)
    objc_msgSend(v3, "setObject:forKey:", wifiEapolControlMode, CFSTR("wifi_eapol_control_mode"));
  wifiEapolSupplicantState = self->_wifiEapolSupplicantState;
  if (wifiEapolSupplicantState)
    objc_msgSend(v3, "setObject:forKey:", wifiEapolSupplicantState, CFSTR("wifi_eapol_supplicant_state"));
  wifiGuardInterval = self->_wifiGuardInterval;
  if (wifiGuardInterval)
    objc_msgSend(v3, "setObject:forKey:", wifiGuardInterval, CFSTR("wifi_guard_interval"));
  wifiHiddenState = self->_wifiHiddenState;
  if (wifiHiddenState)
    objc_msgSend(v3, "setObject:forKey:", wifiHiddenState, CFSTR("wifi_hidden_state"));
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiIsCaptive);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v156, CFSTR("wifi_is_captive"));

  }
  wifiMcsIndex = self->_wifiMcsIndex;
  if (wifiMcsIndex)
    objc_msgSend(v3, "setObject:forKey:", wifiMcsIndex, CFSTR("wifi_mcs_index"));
  wifiNoise = self->_wifiNoise;
  if (wifiNoise)
    objc_msgSend(v3, "setObject:forKey:", wifiNoise, CFSTR("wifi_noise"));
  wifiNumberOfSpatialStreams = self->_wifiNumberOfSpatialStreams;
  if (wifiNumberOfSpatialStreams)
    objc_msgSend(v3, "setObject:forKey:", wifiNumberOfSpatialStreams, CFSTR("wifi_number_of_spatial_streams"));
  wifiOpMode = self->_wifiOpMode;
  if (wifiOpMode)
    objc_msgSend(v3, "setObject:forKey:", wifiOpMode, CFSTR("wifi_op_mode"));
  wifiPhyMode = self->_wifiPhyMode;
  if (wifiPhyMode)
    objc_msgSend(v3, "setObject:forKey:", wifiPhyMode, CFSTR("wifi_phy_mode"));
  wifiRssi = self->_wifiRssi;
  if (wifiRssi)
    objc_msgSend(v3, "setObject:forKey:", wifiRssi, CFSTR("wifi_rssi"));
  wifiSecurity = self->_wifiSecurity;
  if (wifiSecurity)
    objc_msgSend(v3, "setObject:forKey:", wifiSecurity, CFSTR("wifi_security"));
  wifiTxRate = self->_wifiTxRate;
  if (wifiTxRate)
    objc_msgSend(v3, "setObject:forKey:", wifiTxRate, CFSTR("wifi_tx_rate"));
  wrmChannelType = self->_wrmChannelType;
  if (wrmChannelType)
    objc_msgSend(v3, "setObject:forKey:", wrmChannelType, CFSTR("wrm_channel_type"));
  cellularCellid = self->_cellularCellid;
  if (cellularCellid)
    objc_msgSend(v3, "setObject:forKey:", cellularCellid, CFSTR("cellular_cellid"));
  networkQualityResponsiveness = self->_networkQualityResponsiveness;
  if (networkQualityResponsiveness)
    objc_msgSend(v3, "setObject:forKey:", networkQualityResponsiveness, CFSTR("network_quality_responsiveness"));
  cellularAggregatedDLBW = self->_cellularAggregatedDLBW;
  if (cellularAggregatedDLBW)
    objc_msgSend(v3, "setObject:forKey:", cellularAggregatedDLBW, CFSTR("cellular_aggregated_DL_BW"));
  cellularAggregatedULBW = self->_cellularAggregatedULBW;
  if (cellularAggregatedULBW)
    objc_msgSend(v3, "setObject:forKey:", cellularAggregatedULBW, CFSTR("cellular_aggregated_UL_BW"));
  cellularIssa = self->_cellularIssa;
  if (cellularIssa)
    objc_msgSend(v3, "setObject:forKey:", cellularIssa, CFSTR("cellular_issa"));
  cellularLac = self->_cellularLac;
  if (cellularLac)
    objc_msgSend(v3, "setObject:forKey:", cellularLac, CFSTR("cellular_lac"));
  cellularLteNrConfiguredBw = self->_cellularLteNrConfiguredBw;
  if (cellularLteNrConfiguredBw)
    objc_msgSend(v3, "setObject:forKey:", cellularLteNrConfiguredBw, CFSTR("cellular_lte_nr_configured_bw"));
  cellularMaxDlMod = self->_cellularMaxDlMod;
  if (cellularMaxDlMod)
    objc_msgSend(v3, "setObject:forKey:", cellularMaxDlMod, CFSTR("cellular_max_dl_mod"));
  cellularMaxNwMimoLyr = self->_cellularMaxNwMimoLyr;
  if (cellularMaxNwMimoLyr)
    objc_msgSend(v3, "setObject:forKey:", cellularMaxNwMimoLyr, CFSTR("cellular_max_nw_mimo_lyr"));
  cellularMaxSchdMimoLyr = self->_cellularMaxSchdMimoLyr;
  if (cellularMaxSchdMimoLyr)
    objc_msgSend(v3, "setObject:forKey:", cellularMaxSchdMimoLyr, CFSTR("cellular_max_schd_mimo_lyr"));
  cellularMaxUeRank = self->_cellularMaxUeRank;
  if (cellularMaxUeRank)
    objc_msgSend(v3, "setObject:forKey:", cellularMaxUeRank, CFSTR("cellular_max_ue_rank"));
  cellularMaxUlMod = self->_cellularMaxUlMod;
  if (cellularMaxUlMod)
    objc_msgSend(v3, "setObject:forKey:", cellularMaxUlMod, CFSTR("cellular_max_ul_mod"));
  cellularNrSinr = self->_cellularNrSinr;
  if (cellularNrSinr)
    objc_msgSend(v3, "setObject:forKey:", cellularNrSinr, CFSTR("cellular_nr_sinr"));
  cellularNrarfcn = self->_cellularNrarfcn;
  if (cellularNrarfcn)
    objc_msgSend(v3, "setObject:forKey:", cellularNrarfcn, CFSTR("cellular_nrarfcn"));
  cellularRadioFrequency = self->_cellularRadioFrequency;
  if (cellularRadioFrequency)
    objc_msgSend(v3, "setObject:forKey:", cellularRadioFrequency, CFSTR("cellular_radio_frequency"));
  cellularTotalDlMimoLayers = self->_cellularTotalDlMimoLayers;
  if (cellularTotalDlMimoLayers)
    objc_msgSend(v3, "setObject:forKey:", cellularTotalDlMimoLayers, CFSTR("cellular_total_dl_mimo_layers"));
  cellularTotalNumCcs = self->_cellularTotalNumCcs;
  if (cellularTotalNumCcs)
    objc_msgSend(v3, "setObject:forKey:", cellularTotalNumCcs, CFSTR("cellular_total_num_ccs"));
  downloadStartRadioFrequency = self->_downloadStartRadioFrequency;
  if (downloadStartRadioFrequency)
    objc_msgSend(v3, "setObject:forKey:", downloadStartRadioFrequency, CFSTR("download_start_radio_frequency"));
  downloadEndRadioFrequency = self->_downloadEndRadioFrequency;
  if (downloadEndRadioFrequency)
    objc_msgSend(v3, "setObject:forKey:", downloadEndRadioFrequency, CFSTR("download_end_radio_frequency"));
  networkPrimaryIpv6InterfaceName = self->_networkPrimaryIpv6InterfaceName;
  if (networkPrimaryIpv6InterfaceName)
    objc_msgSend(v3, "setObject:forKey:", networkPrimaryIpv6InterfaceName, CFSTR("network_primary_ipv6_interface_name"));
  networkPrimaryIpv6ServiceName = self->_networkPrimaryIpv6ServiceName;
  if (networkPrimaryIpv6ServiceName)
    objc_msgSend(v3, "setObject:forKey:", networkPrimaryIpv6ServiceName, CFSTR("network_primary_ipv6_service_name"));
  uploadStartRadioFrequency = self->_uploadStartRadioFrequency;
  if (uploadStartRadioFrequency)
    objc_msgSend(v3, "setObject:forKey:", uploadStartRadioFrequency, CFSTR("upload_start_radio_frequency"));
  uploadEndRadioFrequency = self->_uploadEndRadioFrequency;
  if (uploadEndRadioFrequency)
    objc_msgSend(v3, "setObject:forKey:", uploadEndRadioFrequency, CFSTR("upload_end_radio_frequency"));
  downloadError = self->_downloadError;
  if (downloadError)
    objc_msgSend(v3, "setObject:forKey:", downloadError, CFSTR("download_error"));
  networkQualityError = self->_networkQualityError;
  if (networkQualityError)
    objc_msgSend(v3, "setObject:forKey:", networkQualityError, CFSTR("network_quality_error"));
  networkQualityDownloadSpeed = self->_networkQualityDownloadSpeed;
  if (networkQualityDownloadSpeed)
    objc_msgSend(v3, "setObject:forKey:", networkQualityDownloadSpeed, CFSTR("network_quality_download_speed"));
  networkQualityUploadSpeed = self->_networkQualityUploadSpeed;
  if (networkQualityUploadSpeed)
    objc_msgSend(v3, "setObject:forKey:", networkQualityUploadSpeed, CFSTR("network_quality_upload_speed"));
  networkQualityRating = self->_networkQualityRating;
  if (networkQualityRating)
    objc_msgSend(v3, "setObject:forKey:", networkQualityRating, CFSTR("network_quality_rating"));
  vpnConnectionState = self->_vpnConnectionState;
  if (vpnConnectionState)
    objc_msgSend(v3, "setObject:forKey:", vpnConnectionState, CFSTR("vpn_connection_state"));
  uploadError = self->_uploadError;
  if (uploadError)
    objc_msgSend(v3, "setObject:forKey:", uploadError, CFSTR("upload_error"));
  uploadErrorDomain = self->_uploadErrorDomain;
  if (uploadErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", uploadErrorDomain, CFSTR("upload_error_domain"));
  uploadErrorCode = self->_uploadErrorCode;
  if (uploadErrorCode)
    objc_msgSend(v3, "setObject:forKey:", uploadErrorCode, CFSTR("upload_error_code"));
  downloadErrorDomain = self->_downloadErrorDomain;
  if (downloadErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", downloadErrorDomain, CFSTR("download_error_domain"));
  downloadErrorCode = self->_downloadErrorCode;
  if (downloadErrorCode)
    objc_msgSend(v3, "setObject:forKey:", downloadErrorCode, CFSTR("download_error_code"));
  pingError = self->_pingError;
  if (pingError)
    objc_msgSend(v3, "setObject:forKey:", pingError, CFSTR("ping_error"));
  pingErrorDomain = self->_pingErrorDomain;
  if (pingErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", pingErrorDomain, CFSTR("ping_error_domain"));
  pingErrorCode = self->_pingErrorCode;
  if (pingErrorCode)
    objc_msgSend(v3, "setObject:forKey:", pingErrorCode, CFSTR("ping_error_code"));
  networkQualityErrorDomain = self->_networkQualityErrorDomain;
  if (networkQualityErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", networkQualityErrorDomain, CFSTR("network_quality_error_domain"));
  networkQualityErrorCode = self->_networkQualityErrorCode;
  if (networkQualityErrorCode)
    objc_msgSend(v3, "setObject:forKey:", networkQualityErrorCode, CFSTR("network_quality_error_code"));
  cellularRnMobileCountryCode = self->_cellularRnMobileCountryCode;
  if (cellularRnMobileCountryCode)
    objc_msgSend(v3, "setObject:forKey:", cellularRnMobileCountryCode, CFSTR("cellular_rn_mobile_country_code"));
  cellularRnMobileNetworkCode = self->_cellularRnMobileNetworkCode;
  if (cellularRnMobileNetworkCode)
    objc_msgSend(v3, "setObject:forKey:", cellularRnMobileNetworkCode, CFSTR("cellular_rn_mobile_network_code"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellularDataIsEnabled);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v207, CFSTR("cellular_data_is_enabled"));

  }
  downloadStartCellularEstimate = self->_downloadStartCellularEstimate;
  if (downloadStartCellularEstimate)
    objc_msgSend(v3, "setObject:forKey:", downloadStartCellularEstimate, CFSTR("download_start_cellular_estimate"));
  downloadEndCellularEstimate = self->_downloadEndCellularEstimate;
  if (downloadEndCellularEstimate)
    objc_msgSend(v3, "setObject:forKey:", downloadEndCellularEstimate, CFSTR("download_end_cellular_estimate"));
  downloadMaxCellularEstimate = self->_downloadMaxCellularEstimate;
  if (downloadMaxCellularEstimate)
    objc_msgSend(v3, "setObject:forKey:", downloadMaxCellularEstimate, CFSTR("download_max_cellular_estimate"));
  uploadStartCellularEstimate = self->_uploadStartCellularEstimate;
  if (uploadStartCellularEstimate)
    objc_msgSend(v3, "setObject:forKey:", uploadStartCellularEstimate, CFSTR("upload_start_cellular_estimate"));
  uploadEndCellularEstimate = self->_uploadEndCellularEstimate;
  if (uploadEndCellularEstimate)
    objc_msgSend(v3, "setObject:forKey:", uploadEndCellularEstimate, CFSTR("upload_end_cellular_estimate"));
  uploadMaxCellularEstimate = self->_uploadMaxCellularEstimate;
  if (uploadMaxCellularEstimate)
    objc_msgSend(v3, "setObject:forKey:", uploadMaxCellularEstimate, CFSTR("upload_max_cellular_estimate"));
  downloadResponsiveness = self->_downloadResponsiveness;
  if (downloadResponsiveness)
    objc_msgSend(v3, "setObject:forKey:", downloadResponsiveness, CFSTR("download_responsiveness"));
  downloadResponsivenessConfidence = self->_downloadResponsivenessConfidence;
  if (downloadResponsivenessConfidence)
    objc_msgSend(v3, "setObject:forKey:", downloadResponsivenessConfidence, CFSTR("download_responsiveness_confidence"));
  downloadResponsivenessRating = self->_downloadResponsivenessRating;
  if (downloadResponsivenessRating)
    objc_msgSend(v3, "setObject:forKey:", downloadResponsivenessRating, CFSTR("download_responsiveness_rating"));
  downloadSpeedConfidence = self->_downloadSpeedConfidence;
  if (downloadSpeedConfidence)
    objc_msgSend(v3, "setObject:forKey:", downloadSpeedConfidence, CFSTR("download_speed_confidence"));
  downloadSpeedRating = self->_downloadSpeedRating;
  if (downloadSpeedRating)
    objc_msgSend(v3, "setObject:forKey:", downloadSpeedRating, CFSTR("download_speed_rating"));
  uploadResponsiveness = self->_uploadResponsiveness;
  if (uploadResponsiveness)
    objc_msgSend(v3, "setObject:forKey:", uploadResponsiveness, CFSTR("upload_responsiveness"));
  uploadResponsivenessConfidence = self->_uploadResponsivenessConfidence;
  if (uploadResponsivenessConfidence)
    objc_msgSend(v3, "setObject:forKey:", uploadResponsivenessConfidence, CFSTR("upload_responsiveness_confidence"));
  uploadResponsivenessRating = self->_uploadResponsivenessRating;
  if (uploadResponsivenessRating)
    objc_msgSend(v3, "setObject:forKey:", uploadResponsivenessRating, CFSTR("upload_responsiveness_rating"));
  uploadSpeedConfidence = self->_uploadSpeedConfidence;
  if (uploadSpeedConfidence)
    objc_msgSend(v3, "setObject:forKey:", uploadSpeedConfidence, CFSTR("upload_speed_confidence"));
  uploadSpeedRating = self->_uploadSpeedRating;
  if (uploadSpeedRating)
    objc_msgSend(v3, "setObject:forKey:", uploadSpeedRating, CFSTR("upload_speed_rating"));
  wifiChannelBand = self->_wifiChannelBand;
  if (wifiChannelBand)
    objc_msgSend(v3, "setObject:forKey:", wifiChannelBand, CFSTR("wifi_channel_band"));
  wifiChannelWidth = self->_wifiChannelWidth;
  if (wifiChannelWidth)
    objc_msgSend(v3, "setObject:forKey:", wifiChannelWidth, CFSTR("wifi_channel_width"));
  v226 = v3;

  return v226;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkPerformanceMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
  }
  if (self->_awdlElectionParameters)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_awdlMasterChannel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_awdlOpMode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_awdlSchedule)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_awdlSecondaryMasterChannel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_awdlSyncChannelSequence)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_awdlSyncState)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_btConnectedDevicesCount)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_24;
      goto LABEL_453;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_453:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_25:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_26:
  if (self->_callingClient)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularActiveContexts)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_cellularAttached)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularBandinfo)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularBandwidth)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularCarrierName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularDataBearerSoMask)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularDataPlanSignalingReductionOverride)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularDataPossible)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularInHomeCountry)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularIndicator)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularIndicatorOverride)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularIsoCountryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularLqm)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularLteMaxScheduledLayers)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMobileCountryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMobileNetworkCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioCoverage)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioDataBearer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioMmwaveDataBearer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioNsaCoverage)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioNsaDataBearer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioSaCoverage)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioSaDataBearer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNewRadioSub6DataBearer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrConfiguredBw)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrLayers)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrModulation)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrRsrp)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrRsrq)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrSnr)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularPid)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRadioAccessTechnology)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRadioAccessTechnologyCtDataStatus)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRoamAllowed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRsrp)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularSnr)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTac)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTotalActiveContexts)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTotalBw)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTotalCcs)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTotalLayers)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularUarfcn)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadCdnPop)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadCdnUuid)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadConnectionTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadDomainLookupTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadEndDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadEndPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadEndRat)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadFileSize)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadInterfaceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadInterfaceServiceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_138:
      if ((*(_WORD *)&v6 & 0x800) == 0)
        goto LABEL_139;
      goto LABEL_457;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_138;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_139:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_140;
    goto LABEL_458;
  }
LABEL_457:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_140:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_141;
    goto LABEL_459;
  }
LABEL_458:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
LABEL_459:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_142:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_143:
  if (self->_downloadMaxSpeedObserved)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadNumberOfStreams)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadProtocolName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadRemoteAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadRemotePort)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadRequestTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadRequestToResponseTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadResponseTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadSecureConnectionTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadServer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadSpeed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadStableSpeed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadStartDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadStartPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadStartRat)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_networkPrimaryIpv4InterfaceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkPrimaryIpv4ServiceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_nptkitFrameworkVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_performanceTestStartTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingLossPercent)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingMaxLatency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingMeanLatency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingMinLatency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingStandardDeviation)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_powerBatteryWarningLevel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_powerSourceType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_powerStateCaps)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemActiveProcessorCount)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemBatteryLevel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemBatteryState)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemDeviceClass)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemDeviceModel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_systemName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemOsVariant)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemPhysicalMemory)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_systemProcessorCount)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_systemVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadCdnPop)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadCdnUuid)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadConnectionTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadDomainLookupTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadEndDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadEndPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadEndRat)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadFileSize)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadInterfaceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadInterfaceServiceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
    {
LABEL_247:
      if ((*(_DWORD *)&v7 & 0x100000) == 0)
        goto LABEL_248;
      goto LABEL_463;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
    goto LABEL_247;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_248:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_249;
    goto LABEL_464;
  }
LABEL_463:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_249:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_250;
    goto LABEL_465;
  }
LABEL_464:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_250:
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
      goto LABEL_252;
    goto LABEL_251;
  }
LABEL_465:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_251:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_252:
  if (self->_uploadMaxSpeedObserved)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadNumberOfStreams)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadProtocolName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadRemoteAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadRemotePort)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadRequestTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadRequestToResponseTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadResponseTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadSecureConnectionTime)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadServer)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadSpeed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadStableSpeed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadStartDataBearerTechnology)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadStartPrimaryIpv4Interface)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadStartRat)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_wifiAveragePhyRateRx)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiAverageRssi)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiAverageSnr)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiAverageTcpRtt)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiBtcMode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiCca)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiChannel)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiCwfCca)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiEapolControlMode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiEapolSupplicantState)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiGuardInterval)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiHiddenState)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_wifiMcsIndex)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiNoise)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiNumberOfSpatialStreams)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiOpMode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiPhyMode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiRssi)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiSecurity)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiTxRate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wrmChannelType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularCellid)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_networkQualityResponsiveness)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularAggregatedDLBW)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularAggregatedULBW)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularIssa)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularLac)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularLteNrConfiguredBw)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMaxDlMod)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMaxNwMimoLyr)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMaxSchdMimoLyr)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMaxUeRank)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularMaxUlMod)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrSinr)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularNrarfcn)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRadioFrequency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTotalDlMimoLayers)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularTotalNumCcs)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadStartRadioFrequency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadEndRadioFrequency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkPrimaryIpv6InterfaceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkPrimaryIpv6ServiceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadStartRadioFrequency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadEndRadioFrequency)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadError)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkQualityError)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkQualityDownloadSpeed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkQualityUploadSpeed)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkQualityRating)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_vpnConnectionState)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadError)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadErrorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadErrorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadErrorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadErrorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingError)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingErrorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_pingErrorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkQualityErrorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_networkQualityErrorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRnMobileCountryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_cellularRnMobileNetworkCode)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_downloadStartCellularEstimate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadEndCellularEstimate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadMaxCellularEstimate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadStartCellularEstimate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadEndCellularEstimate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadMaxCellularEstimate)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadResponsiveness)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadResponsivenessConfidence)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadResponsivenessRating)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadSpeedConfidence)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_downloadSpeedRating)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadResponsiveness)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadResponsivenessConfidence)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadResponsivenessRating)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadSpeedConfidence)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_uploadSpeedRating)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiChannelBand)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_wifiChannelWidth)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v6;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v7;
  _QWORD *v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 421) |= 1u;
  }
  v8 = v4;
  if (self->_awdlElectionParameters)
  {
    objc_msgSend(v4, "setAwdlElectionParameters:");
    v4 = v8;
  }
  if (self->_awdlMasterChannel)
  {
    objc_msgSend(v8, "setAwdlMasterChannel:");
    v4 = v8;
  }
  if (self->_awdlOpMode)
  {
    objc_msgSend(v8, "setAwdlOpMode:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 1657) = self->_awdlPowerState;
    *((_DWORD *)v4 + 421) |= 4u;
  }
  if (self->_awdlSchedule)
  {
    objc_msgSend(v8, "setAwdlSchedule:");
    v4 = v8;
  }
  if (self->_awdlSecondaryMasterChannel)
  {
    objc_msgSend(v8, "setAwdlSecondaryMasterChannel:");
    v4 = v8;
  }
  if (self->_awdlSyncChannelSequence)
  {
    objc_msgSend(v8, "setAwdlSyncChannelSequence:");
    v4 = v8;
  }
  if (self->_awdlSyncState)
  {
    objc_msgSend(v8, "setAwdlSyncState:");
    v4 = v8;
  }
  if (self->_btConnectedDevicesCount)
  {
    objc_msgSend(v8, "setBtConnectedDevicesCount:");
    v4 = v8;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *((_BYTE *)v4 + 1658) = self->_btIsConnectable;
    *((_DWORD *)v4 + 421) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_24;
      goto LABEL_453;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_BYTE *)v4 + 1659) = self->_btIsDiscoverable;
  *((_DWORD *)v4 + 421) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_453:
  *((_BYTE *)v4 + 1660) = self->_btIsPowerOn;
  *((_DWORD *)v4 + 421) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_25:
    *((_BYTE *)v4 + 1661) = self->_btIsScanning;
    *((_DWORD *)v4 + 421) |= 0x40u;
  }
LABEL_26:
  if (self->_callingClient)
  {
    objc_msgSend(v8, "setCallingClient:");
    v4 = v8;
  }
  if (self->_cellularActiveContexts)
  {
    objc_msgSend(v8, "setCellularActiveContexts:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *((_BYTE *)v4 + 1662) = self->_cellularAllowsVoip;
    *((_DWORD *)v4 + 421) |= 0x80u;
  }
  if (self->_cellularAttached)
  {
    objc_msgSend(v8, "setCellularAttached:");
    v4 = v8;
  }
  if (self->_cellularBandinfo)
  {
    objc_msgSend(v8, "setCellularBandinfo:");
    v4 = v8;
  }
  if (self->_cellularBandwidth)
  {
    objc_msgSend(v8, "setCellularBandwidth:");
    v4 = v8;
  }
  if (self->_cellularCarrierName)
  {
    objc_msgSend(v8, "setCellularCarrierName:");
    v4 = v8;
  }
  if (self->_cellularDataBearerSoMask)
  {
    objc_msgSend(v8, "setCellularDataBearerSoMask:");
    v4 = v8;
  }
  if (self->_cellularDataBearerTechnology)
  {
    objc_msgSend(v8, "setCellularDataBearerTechnology:");
    v4 = v8;
  }
  if (self->_cellularDataPlanSignalingReductionOverride)
  {
    objc_msgSend(v8, "setCellularDataPlanSignalingReductionOverride:");
    v4 = v8;
  }
  if (self->_cellularDataPossible)
  {
    objc_msgSend(v8, "setCellularDataPossible:");
    v4 = v8;
  }
  if (self->_cellularInHomeCountry)
  {
    objc_msgSend(v8, "setCellularInHomeCountry:");
    v4 = v8;
  }
  if (self->_cellularIndicator)
  {
    objc_msgSend(v8, "setCellularIndicator:");
    v4 = v8;
  }
  if (self->_cellularIndicatorOverride)
  {
    objc_msgSend(v8, "setCellularIndicatorOverride:");
    v4 = v8;
  }
  if (self->_cellularIsoCountryCode)
  {
    objc_msgSend(v8, "setCellularIsoCountryCode:");
    v4 = v8;
  }
  if (self->_cellularLqm)
  {
    objc_msgSend(v8, "setCellularLqm:");
    v4 = v8;
  }
  if (self->_cellularLteMaxScheduledLayers)
  {
    objc_msgSend(v8, "setCellularLteMaxScheduledLayers:");
    v4 = v8;
  }
  if (self->_cellularMobileCountryCode)
  {
    objc_msgSend(v8, "setCellularMobileCountryCode:");
    v4 = v8;
  }
  if (self->_cellularMobileNetworkCode)
  {
    objc_msgSend(v8, "setCellularMobileNetworkCode:");
    v4 = v8;
  }
  if (self->_cellularNewRadioCoverage)
  {
    objc_msgSend(v8, "setCellularNewRadioCoverage:");
    v4 = v8;
  }
  if (self->_cellularNewRadioDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioDataBearer:");
    v4 = v8;
  }
  if (self->_cellularNewRadioMmwaveDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioMmwaveDataBearer:");
    v4 = v8;
  }
  if (self->_cellularNewRadioNsaCoverage)
  {
    objc_msgSend(v8, "setCellularNewRadioNsaCoverage:");
    v4 = v8;
  }
  if (self->_cellularNewRadioNsaDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioNsaDataBearer:");
    v4 = v8;
  }
  if (self->_cellularNewRadioSaCoverage)
  {
    objc_msgSend(v8, "setCellularNewRadioSaCoverage:");
    v4 = v8;
  }
  if (self->_cellularNewRadioSaDataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioSaDataBearer:");
    v4 = v8;
  }
  if (self->_cellularNewRadioSub6DataBearer)
  {
    objc_msgSend(v8, "setCellularNewRadioSub6DataBearer:");
    v4 = v8;
  }
  if (self->_cellularNrConfiguredBw)
  {
    objc_msgSend(v8, "setCellularNrConfiguredBw:");
    v4 = v8;
  }
  if (self->_cellularNrLayers)
  {
    objc_msgSend(v8, "setCellularNrLayers:");
    v4 = v8;
  }
  if (self->_cellularNrModulation)
  {
    objc_msgSend(v8, "setCellularNrModulation:");
    v4 = v8;
  }
  if (self->_cellularNrRsrp)
  {
    objc_msgSend(v8, "setCellularNrRsrp:");
    v4 = v8;
  }
  if (self->_cellularNrRsrq)
  {
    objc_msgSend(v8, "setCellularNrRsrq:");
    v4 = v8;
  }
  if (self->_cellularNrSnr)
  {
    objc_msgSend(v8, "setCellularNrSnr:");
    v4 = v8;
  }
  if (self->_cellularPid)
  {
    objc_msgSend(v8, "setCellularPid:");
    v4 = v8;
  }
  if (self->_cellularRadioAccessTechnology)
  {
    objc_msgSend(v8, "setCellularRadioAccessTechnology:");
    v4 = v8;
  }
  if (self->_cellularRadioAccessTechnologyCtDataStatus)
  {
    objc_msgSend(v8, "setCellularRadioAccessTechnologyCtDataStatus:");
    v4 = v8;
  }
  if (self->_cellularRoamAllowed)
  {
    objc_msgSend(v8, "setCellularRoamAllowed:");
    v4 = v8;
  }
  if (self->_cellularRsrp)
  {
    objc_msgSend(v8, "setCellularRsrp:");
    v4 = v8;
  }
  if (self->_cellularSnr)
  {
    objc_msgSend(v8, "setCellularSnr:");
    v4 = v8;
  }
  if (self->_cellularTac)
  {
    objc_msgSend(v8, "setCellularTac:");
    v4 = v8;
  }
  if (self->_cellularTotalActiveContexts)
  {
    objc_msgSend(v8, "setCellularTotalActiveContexts:");
    v4 = v8;
  }
  if (self->_cellularTotalBw)
  {
    objc_msgSend(v8, "setCellularTotalBw:");
    v4 = v8;
  }
  if (self->_cellularTotalCcs)
  {
    objc_msgSend(v8, "setCellularTotalCcs:");
    v4 = v8;
  }
  if (self->_cellularTotalLayers)
  {
    objc_msgSend(v8, "setCellularTotalLayers:");
    v4 = v8;
  }
  if (self->_cellularUarfcn)
  {
    objc_msgSend(v8, "setCellularUarfcn:");
    v4 = v8;
  }
  if (self->_downloadCdnPop)
  {
    objc_msgSend(v8, "setDownloadCdnPop:");
    v4 = v8;
  }
  if (self->_downloadCdnUuid)
  {
    objc_msgSend(v8, "setDownloadCdnUuid:");
    v4 = v8;
  }
  if (self->_downloadConnectionTime)
  {
    objc_msgSend(v8, "setDownloadConnectionTime:");
    v4 = v8;
  }
  if (self->_downloadDomainLookupTime)
  {
    objc_msgSend(v8, "setDownloadDomainLookupTime:");
    v4 = v8;
  }
  if (self->_downloadEndDataBearerTechnology)
  {
    objc_msgSend(v8, "setDownloadEndDataBearerTechnology:");
    v4 = v8;
  }
  if (self->_downloadEndPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setDownloadEndPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (self->_downloadEndRat)
  {
    objc_msgSend(v8, "setDownloadEndRat:");
    v4 = v8;
  }
  if (self->_downloadFileSize)
  {
    objc_msgSend(v8, "setDownloadFileSize:");
    v4 = v8;
  }
  if (self->_downloadInterfaceName)
  {
    objc_msgSend(v8, "setDownloadInterfaceName:");
    v4 = v8;
  }
  if (self->_downloadInterfaceServiceName)
  {
    objc_msgSend(v8, "setDownloadInterfaceServiceName:");
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 1664) = self->_downloadIsCellular;
    *((_DWORD *)v4 + 421) |= 0x200u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_138:
      if ((*(_WORD *)&v6 & 0x800) == 0)
        goto LABEL_139;
      goto LABEL_457;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_138;
  }
  *((_BYTE *)v4 + 1665) = self->_downloadIsConstrained;
  *((_DWORD *)v4 + 421) |= 0x400u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_139:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_140;
    goto LABEL_458;
  }
LABEL_457:
  *((_BYTE *)v4 + 1666) = self->_downloadIsExpensive;
  *((_DWORD *)v4 + 421) |= 0x800u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_140:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_141;
    goto LABEL_459;
  }
LABEL_458:
  *((_BYTE *)v4 + 1667) = self->_downloadIsMultipath;
  *((_DWORD *)v4 + 421) |= 0x1000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_141:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
LABEL_459:
  *((_BYTE *)v4 + 1668) = self->_downloadIsProxyConnection;
  *((_DWORD *)v4 + 421) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_142:
    *((_BYTE *)v4 + 1669) = self->_downloadIsReusedConnection;
    *((_DWORD *)v4 + 421) |= 0x4000u;
  }
LABEL_143:
  if (self->_downloadMaxSpeedObserved)
  {
    objc_msgSend(v8, "setDownloadMaxSpeedObserved:");
    v4 = v8;
  }
  if (self->_downloadNumberOfStreams)
  {
    objc_msgSend(v8, "setDownloadNumberOfStreams:");
    v4 = v8;
  }
  if (self->_downloadProtocolName)
  {
    objc_msgSend(v8, "setDownloadProtocolName:");
    v4 = v8;
  }
  if (self->_downloadRemoteAddress)
  {
    objc_msgSend(v8, "setDownloadRemoteAddress:");
    v4 = v8;
  }
  if (self->_downloadRemotePort)
  {
    objc_msgSend(v8, "setDownloadRemotePort:");
    v4 = v8;
  }
  if (self->_downloadRequestTime)
  {
    objc_msgSend(v8, "setDownloadRequestTime:");
    v4 = v8;
  }
  if (self->_downloadRequestToResponseTime)
  {
    objc_msgSend(v8, "setDownloadRequestToResponseTime:");
    v4 = v8;
  }
  if (self->_downloadResponseTime)
  {
    objc_msgSend(v8, "setDownloadResponseTime:");
    v4 = v8;
  }
  if (self->_downloadSecureConnectionTime)
  {
    objc_msgSend(v8, "setDownloadSecureConnectionTime:");
    v4 = v8;
  }
  if (self->_downloadServer)
  {
    objc_msgSend(v8, "setDownloadServer:");
    v4 = v8;
  }
  if (self->_downloadSpeed)
  {
    objc_msgSend(v8, "setDownloadSpeed:");
    v4 = v8;
  }
  if (self->_downloadStableSpeed)
  {
    objc_msgSend(v8, "setDownloadStableSpeed:");
    v4 = v8;
  }
  if (self->_downloadStartDataBearerTechnology)
  {
    objc_msgSend(v8, "setDownloadStartDataBearerTechnology:");
    v4 = v8;
  }
  if (self->_downloadStartPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setDownloadStartPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (self->_downloadStartRat)
  {
    objc_msgSend(v8, "setDownloadStartRat:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *((_BYTE *)v4 + 1670) = self->_networkIsAppleReachable;
    *((_DWORD *)v4 + 421) |= 0x8000u;
  }
  if (self->_networkPrimaryIpv4InterfaceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv4InterfaceName:");
    v4 = v8;
  }
  if (self->_networkPrimaryIpv4ServiceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv4ServiceName:");
    v4 = v8;
  }
  if (self->_nptkitFrameworkVersion)
  {
    objc_msgSend(v8, "setNptkitFrameworkVersion:");
    v4 = v8;
  }
  if (self->_performanceTestStartTime)
  {
    objc_msgSend(v8, "setPerformanceTestStartTime:");
    v4 = v8;
  }
  if (self->_pingAddress)
  {
    objc_msgSend(v8, "setPingAddress:");
    v4 = v8;
  }
  if (self->_pingLossPercent)
  {
    objc_msgSend(v8, "setPingLossPercent:");
    v4 = v8;
  }
  if (self->_pingMaxLatency)
  {
    objc_msgSend(v8, "setPingMaxLatency:");
    v4 = v8;
  }
  if (self->_pingMeanLatency)
  {
    objc_msgSend(v8, "setPingMeanLatency:");
    v4 = v8;
  }
  if (self->_pingMinLatency)
  {
    objc_msgSend(v8, "setPingMinLatency:");
    v4 = v8;
  }
  if (self->_pingStandardDeviation)
  {
    objc_msgSend(v8, "setPingStandardDeviation:");
    v4 = v8;
  }
  if (self->_powerBatteryWarningLevel)
  {
    objc_msgSend(v8, "setPowerBatteryWarningLevel:");
    v4 = v8;
  }
  if (self->_powerSourceType)
  {
    objc_msgSend(v8, "setPowerSourceType:");
    v4 = v8;
  }
  if (self->_powerStateCaps)
  {
    objc_msgSend(v8, "setPowerStateCaps:");
    v4 = v8;
  }
  if (self->_systemActiveProcessorCount)
  {
    objc_msgSend(v8, "setSystemActiveProcessorCount:");
    v4 = v8;
  }
  if (self->_systemBatteryLevel)
  {
    objc_msgSend(v8, "setSystemBatteryLevel:");
    v4 = v8;
  }
  if (self->_systemBatteryState)
  {
    objc_msgSend(v8, "setSystemBatteryState:");
    v4 = v8;
  }
  if (self->_systemDeviceClass)
  {
    objc_msgSend(v8, "setSystemDeviceClass:");
    v4 = v8;
  }
  if (self->_systemDeviceModel)
  {
    objc_msgSend(v8, "setSystemDeviceModel:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *((_BYTE *)v4 + 1671) = self->_systemLowPowerModeEnabled;
    *((_DWORD *)v4 + 421) |= 0x10000u;
  }
  if (self->_systemName)
  {
    objc_msgSend(v8, "setSystemName:");
    v4 = v8;
  }
  if (self->_systemOsVariant)
  {
    objc_msgSend(v8, "setSystemOsVariant:");
    v4 = v8;
  }
  if (self->_systemPhysicalMemory)
  {
    objc_msgSend(v8, "setSystemPhysicalMemory:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *((_BYTE *)v4 + 1672) = self->_systemPowersourceConnected;
    *((_DWORD *)v4 + 421) |= 0x20000u;
  }
  if (self->_systemProcessorCount)
  {
    objc_msgSend(v8, "setSystemProcessorCount:");
    v4 = v8;
  }
  if (self->_systemVersion)
  {
    objc_msgSend(v8, "setSystemVersion:");
    v4 = v8;
  }
  if (self->_uploadCdnPop)
  {
    objc_msgSend(v8, "setUploadCdnPop:");
    v4 = v8;
  }
  if (self->_uploadCdnUuid)
  {
    objc_msgSend(v8, "setUploadCdnUuid:");
    v4 = v8;
  }
  if (self->_uploadConnectionTime)
  {
    objc_msgSend(v8, "setUploadConnectionTime:");
    v4 = v8;
  }
  if (self->_uploadDomainLookupTime)
  {
    objc_msgSend(v8, "setUploadDomainLookupTime:");
    v4 = v8;
  }
  if (self->_uploadEndDataBearerTechnology)
  {
    objc_msgSend(v8, "setUploadEndDataBearerTechnology:");
    v4 = v8;
  }
  if (self->_uploadEndPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setUploadEndPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (self->_uploadEndRat)
  {
    objc_msgSend(v8, "setUploadEndRat:");
    v4 = v8;
  }
  if (self->_uploadFileSize)
  {
    objc_msgSend(v8, "setUploadFileSize:");
    v4 = v8;
  }
  if (self->_uploadInterfaceName)
  {
    objc_msgSend(v8, "setUploadInterfaceName:");
    v4 = v8;
  }
  if (self->_uploadInterfaceServiceName)
  {
    objc_msgSend(v8, "setUploadInterfaceServiceName:");
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    *((_BYTE *)v4 + 1673) = self->_uploadIsCellular;
    *((_DWORD *)v4 + 421) |= 0x40000u;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
    {
LABEL_247:
      if ((*(_DWORD *)&v7 & 0x100000) == 0)
        goto LABEL_248;
      goto LABEL_463;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
    goto LABEL_247;
  }
  *((_BYTE *)v4 + 1674) = self->_uploadIsConstrained;
  *((_DWORD *)v4 + 421) |= 0x80000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_248:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_249;
    goto LABEL_464;
  }
LABEL_463:
  *((_BYTE *)v4 + 1675) = self->_uploadIsExpensive;
  *((_DWORD *)v4 + 421) |= 0x100000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_249:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_250;
    goto LABEL_465;
  }
LABEL_464:
  *((_BYTE *)v4 + 1676) = self->_uploadIsMultipath;
  *((_DWORD *)v4 + 421) |= 0x200000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_250:
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
      goto LABEL_252;
    goto LABEL_251;
  }
LABEL_465:
  *((_BYTE *)v4 + 1677) = self->_uploadIsProxyConnection;
  *((_DWORD *)v4 + 421) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_251:
    *((_BYTE *)v4 + 1678) = self->_uploadIsReusedConnection;
    *((_DWORD *)v4 + 421) |= 0x800000u;
  }
LABEL_252:
  if (self->_uploadMaxSpeedObserved)
  {
    objc_msgSend(v8, "setUploadMaxSpeedObserved:");
    v4 = v8;
  }
  if (self->_uploadNumberOfStreams)
  {
    objc_msgSend(v8, "setUploadNumberOfStreams:");
    v4 = v8;
  }
  if (self->_uploadProtocolName)
  {
    objc_msgSend(v8, "setUploadProtocolName:");
    v4 = v8;
  }
  if (self->_uploadRemoteAddress)
  {
    objc_msgSend(v8, "setUploadRemoteAddress:");
    v4 = v8;
  }
  if (self->_uploadRemotePort)
  {
    objc_msgSend(v8, "setUploadRemotePort:");
    v4 = v8;
  }
  if (self->_uploadRequestTime)
  {
    objc_msgSend(v8, "setUploadRequestTime:");
    v4 = v8;
  }
  if (self->_uploadRequestToResponseTime)
  {
    objc_msgSend(v8, "setUploadRequestToResponseTime:");
    v4 = v8;
  }
  if (self->_uploadResponseTime)
  {
    objc_msgSend(v8, "setUploadResponseTime:");
    v4 = v8;
  }
  if (self->_uploadSecureConnectionTime)
  {
    objc_msgSend(v8, "setUploadSecureConnectionTime:");
    v4 = v8;
  }
  if (self->_uploadServer)
  {
    objc_msgSend(v8, "setUploadServer:");
    v4 = v8;
  }
  if (self->_uploadSpeed)
  {
    objc_msgSend(v8, "setUploadSpeed:");
    v4 = v8;
  }
  if (self->_uploadStableSpeed)
  {
    objc_msgSend(v8, "setUploadStableSpeed:");
    v4 = v8;
  }
  if (self->_uploadStartDataBearerTechnology)
  {
    objc_msgSend(v8, "setUploadStartDataBearerTechnology:");
    v4 = v8;
  }
  if (self->_uploadStartPrimaryIpv4Interface)
  {
    objc_msgSend(v8, "setUploadStartPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (self->_uploadStartRat)
  {
    objc_msgSend(v8, "setUploadStartRat:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *((_BYTE *)v4 + 1679) = self->_useWifiWasSpecified;
    *((_DWORD *)v4 + 421) |= 0x1000000u;
  }
  if (self->_wifiAveragePhyRateRx)
  {
    objc_msgSend(v8, "setWifiAveragePhyRateRx:");
    v4 = v8;
  }
  if (self->_wifiAverageRssi)
  {
    objc_msgSend(v8, "setWifiAverageRssi:");
    v4 = v8;
  }
  if (self->_wifiAverageSnr)
  {
    objc_msgSend(v8, "setWifiAverageSnr:");
    v4 = v8;
  }
  if (self->_wifiAverageTcpRtt)
  {
    objc_msgSend(v8, "setWifiAverageTcpRtt:");
    v4 = v8;
  }
  if (self->_wifiBtcMode)
  {
    objc_msgSend(v8, "setWifiBtcMode:");
    v4 = v8;
  }
  if (self->_wifiCca)
  {
    objc_msgSend(v8, "setWifiCca:");
    v4 = v8;
  }
  if (self->_wifiChannel)
  {
    objc_msgSend(v8, "setWifiChannel:");
    v4 = v8;
  }
  if (self->_wifiCwfCca)
  {
    objc_msgSend(v8, "setWifiCwfCca:");
    v4 = v8;
  }
  if (self->_wifiEapolControlMode)
  {
    objc_msgSend(v8, "setWifiEapolControlMode:");
    v4 = v8;
  }
  if (self->_wifiEapolSupplicantState)
  {
    objc_msgSend(v8, "setWifiEapolSupplicantState:");
    v4 = v8;
  }
  if (self->_wifiGuardInterval)
  {
    objc_msgSend(v8, "setWifiGuardInterval:");
    v4 = v8;
  }
  if (self->_wifiHiddenState)
  {
    objc_msgSend(v8, "setWifiHiddenState:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    *((_BYTE *)v4 + 1680) = self->_wifiIsCaptive;
    *((_DWORD *)v4 + 421) |= 0x2000000u;
  }
  if (self->_wifiMcsIndex)
  {
    objc_msgSend(v8, "setWifiMcsIndex:");
    v4 = v8;
  }
  if (self->_wifiNoise)
  {
    objc_msgSend(v8, "setWifiNoise:");
    v4 = v8;
  }
  if (self->_wifiNumberOfSpatialStreams)
  {
    objc_msgSend(v8, "setWifiNumberOfSpatialStreams:");
    v4 = v8;
  }
  if (self->_wifiOpMode)
  {
    objc_msgSend(v8, "setWifiOpMode:");
    v4 = v8;
  }
  if (self->_wifiPhyMode)
  {
    objc_msgSend(v8, "setWifiPhyMode:");
    v4 = v8;
  }
  if (self->_wifiRssi)
  {
    objc_msgSend(v8, "setWifiRssi:");
    v4 = v8;
  }
  if (self->_wifiSecurity)
  {
    objc_msgSend(v8, "setWifiSecurity:");
    v4 = v8;
  }
  if (self->_wifiTxRate)
  {
    objc_msgSend(v8, "setWifiTxRate:");
    v4 = v8;
  }
  if (self->_wrmChannelType)
  {
    objc_msgSend(v8, "setWrmChannelType:");
    v4 = v8;
  }
  if (self->_cellularCellid)
  {
    objc_msgSend(v8, "setCellularCellid:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 1656) = self->_acceptablePerformanceResult;
    *((_DWORD *)v4 + 421) |= 2u;
  }
  if (self->_networkQualityResponsiveness)
  {
    objc_msgSend(v8, "setNetworkQualityResponsiveness:");
    v4 = v8;
  }
  if (self->_cellularAggregatedDLBW)
  {
    objc_msgSend(v8, "setCellularAggregatedDLBW:");
    v4 = v8;
  }
  if (self->_cellularAggregatedULBW)
  {
    objc_msgSend(v8, "setCellularAggregatedULBW:");
    v4 = v8;
  }
  if (self->_cellularIssa)
  {
    objc_msgSend(v8, "setCellularIssa:");
    v4 = v8;
  }
  if (self->_cellularLac)
  {
    objc_msgSend(v8, "setCellularLac:");
    v4 = v8;
  }
  if (self->_cellularLteNrConfiguredBw)
  {
    objc_msgSend(v8, "setCellularLteNrConfiguredBw:");
    v4 = v8;
  }
  if (self->_cellularMaxDlMod)
  {
    objc_msgSend(v8, "setCellularMaxDlMod:");
    v4 = v8;
  }
  if (self->_cellularMaxNwMimoLyr)
  {
    objc_msgSend(v8, "setCellularMaxNwMimoLyr:");
    v4 = v8;
  }
  if (self->_cellularMaxSchdMimoLyr)
  {
    objc_msgSend(v8, "setCellularMaxSchdMimoLyr:");
    v4 = v8;
  }
  if (self->_cellularMaxUeRank)
  {
    objc_msgSend(v8, "setCellularMaxUeRank:");
    v4 = v8;
  }
  if (self->_cellularMaxUlMod)
  {
    objc_msgSend(v8, "setCellularMaxUlMod:");
    v4 = v8;
  }
  if (self->_cellularNrSinr)
  {
    objc_msgSend(v8, "setCellularNrSinr:");
    v4 = v8;
  }
  if (self->_cellularNrarfcn)
  {
    objc_msgSend(v8, "setCellularNrarfcn:");
    v4 = v8;
  }
  if (self->_cellularRadioFrequency)
  {
    objc_msgSend(v8, "setCellularRadioFrequency:");
    v4 = v8;
  }
  if (self->_cellularTotalDlMimoLayers)
  {
    objc_msgSend(v8, "setCellularTotalDlMimoLayers:");
    v4 = v8;
  }
  if (self->_cellularTotalNumCcs)
  {
    objc_msgSend(v8, "setCellularTotalNumCcs:");
    v4 = v8;
  }
  if (self->_downloadStartRadioFrequency)
  {
    objc_msgSend(v8, "setDownloadStartRadioFrequency:");
    v4 = v8;
  }
  if (self->_downloadEndRadioFrequency)
  {
    objc_msgSend(v8, "setDownloadEndRadioFrequency:");
    v4 = v8;
  }
  if (self->_networkPrimaryIpv6InterfaceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv6InterfaceName:");
    v4 = v8;
  }
  if (self->_networkPrimaryIpv6ServiceName)
  {
    objc_msgSend(v8, "setNetworkPrimaryIpv6ServiceName:");
    v4 = v8;
  }
  if (self->_uploadStartRadioFrequency)
  {
    objc_msgSend(v8, "setUploadStartRadioFrequency:");
    v4 = v8;
  }
  if (self->_uploadEndRadioFrequency)
  {
    objc_msgSend(v8, "setUploadEndRadioFrequency:");
    v4 = v8;
  }
  if (self->_downloadError)
  {
    objc_msgSend(v8, "setDownloadError:");
    v4 = v8;
  }
  if (self->_networkQualityError)
  {
    objc_msgSend(v8, "setNetworkQualityError:");
    v4 = v8;
  }
  if (self->_networkQualityDownloadSpeed)
  {
    objc_msgSend(v8, "setNetworkQualityDownloadSpeed:");
    v4 = v8;
  }
  if (self->_networkQualityUploadSpeed)
  {
    objc_msgSend(v8, "setNetworkQualityUploadSpeed:");
    v4 = v8;
  }
  if (self->_networkQualityRating)
  {
    objc_msgSend(v8, "setNetworkQualityRating:");
    v4 = v8;
  }
  if (self->_vpnConnectionState)
  {
    objc_msgSend(v8, "setVpnConnectionState:");
    v4 = v8;
  }
  if (self->_uploadError)
  {
    objc_msgSend(v8, "setUploadError:");
    v4 = v8;
  }
  if (self->_uploadErrorDomain)
  {
    objc_msgSend(v8, "setUploadErrorDomain:");
    v4 = v8;
  }
  if (self->_uploadErrorCode)
  {
    objc_msgSend(v8, "setUploadErrorCode:");
    v4 = v8;
  }
  if (self->_downloadErrorDomain)
  {
    objc_msgSend(v8, "setDownloadErrorDomain:");
    v4 = v8;
  }
  if (self->_downloadErrorCode)
  {
    objc_msgSend(v8, "setDownloadErrorCode:");
    v4 = v8;
  }
  if (self->_pingError)
  {
    objc_msgSend(v8, "setPingError:");
    v4 = v8;
  }
  if (self->_pingErrorDomain)
  {
    objc_msgSend(v8, "setPingErrorDomain:");
    v4 = v8;
  }
  if (self->_pingErrorCode)
  {
    objc_msgSend(v8, "setPingErrorCode:");
    v4 = v8;
  }
  if (self->_networkQualityErrorDomain)
  {
    objc_msgSend(v8, "setNetworkQualityErrorDomain:");
    v4 = v8;
  }
  if (self->_networkQualityErrorCode)
  {
    objc_msgSend(v8, "setNetworkQualityErrorCode:");
    v4 = v8;
  }
  if (self->_cellularRnMobileCountryCode)
  {
    objc_msgSend(v8, "setCellularRnMobileCountryCode:");
    v4 = v8;
  }
  if (self->_cellularRnMobileNetworkCode)
  {
    objc_msgSend(v8, "setCellularRnMobileNetworkCode:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *((_BYTE *)v4 + 1663) = self->_cellularDataIsEnabled;
    *((_DWORD *)v4 + 421) |= 0x100u;
  }
  if (self->_downloadStartCellularEstimate)
  {
    objc_msgSend(v8, "setDownloadStartCellularEstimate:");
    v4 = v8;
  }
  if (self->_downloadEndCellularEstimate)
  {
    objc_msgSend(v8, "setDownloadEndCellularEstimate:");
    v4 = v8;
  }
  if (self->_downloadMaxCellularEstimate)
  {
    objc_msgSend(v8, "setDownloadMaxCellularEstimate:");
    v4 = v8;
  }
  if (self->_uploadStartCellularEstimate)
  {
    objc_msgSend(v8, "setUploadStartCellularEstimate:");
    v4 = v8;
  }
  if (self->_uploadEndCellularEstimate)
  {
    objc_msgSend(v8, "setUploadEndCellularEstimate:");
    v4 = v8;
  }
  if (self->_uploadMaxCellularEstimate)
  {
    objc_msgSend(v8, "setUploadMaxCellularEstimate:");
    v4 = v8;
  }
  if (self->_downloadResponsiveness)
  {
    objc_msgSend(v8, "setDownloadResponsiveness:");
    v4 = v8;
  }
  if (self->_downloadResponsivenessConfidence)
  {
    objc_msgSend(v8, "setDownloadResponsivenessConfidence:");
    v4 = v8;
  }
  if (self->_downloadResponsivenessRating)
  {
    objc_msgSend(v8, "setDownloadResponsivenessRating:");
    v4 = v8;
  }
  if (self->_downloadSpeedConfidence)
  {
    objc_msgSend(v8, "setDownloadSpeedConfidence:");
    v4 = v8;
  }
  if (self->_downloadSpeedRating)
  {
    objc_msgSend(v8, "setDownloadSpeedRating:");
    v4 = v8;
  }
  if (self->_uploadResponsiveness)
  {
    objc_msgSend(v8, "setUploadResponsiveness:");
    v4 = v8;
  }
  if (self->_uploadResponsivenessConfidence)
  {
    objc_msgSend(v8, "setUploadResponsivenessConfidence:");
    v4 = v8;
  }
  if (self->_uploadResponsivenessRating)
  {
    objc_msgSend(v8, "setUploadResponsivenessRating:");
    v4 = v8;
  }
  if (self->_uploadSpeedConfidence)
  {
    objc_msgSend(v8, "setUploadSpeedConfidence:");
    v4 = v8;
  }
  if (self->_uploadSpeedRating)
  {
    objc_msgSend(v8, "setUploadSpeedRating:");
    v4 = v8;
  }
  if (self->_wifiChannelBand)
  {
    objc_msgSend(v8, "setWifiChannelBand:");
    v4 = v8;
  }
  if (self->_wifiChannelWidth)
  {
    objc_msgSend(v8, "setWifiChannelWidth:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  void *v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  void *v228;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  void *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  void *v241;
  uint64_t v242;
  void *v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  void *v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  void *v257;
  uint64_t v258;
  void *v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  void *v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  void *v277;
  uint64_t v278;
  void *v279;
  uint64_t v280;
  void *v281;
  uint64_t v282;
  void *v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  void *v289;
  uint64_t v290;
  void *v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  void *v299;
  uint64_t v300;
  void *v301;
  uint64_t v302;
  void *v303;
  uint64_t v304;
  void *v305;
  uint64_t v306;
  void *v307;
  uint64_t v308;
  void *v309;
  uint64_t v310;
  void *v311;
  uint64_t v312;
  void *v313;
  uint64_t v314;
  void *v315;
  uint64_t v316;
  void *v317;
  uint64_t v318;
  void *v319;
  uint64_t v320;
  void *v321;
  uint64_t v322;
  void *v323;
  uint64_t v324;
  void *v325;
  uint64_t v326;
  void *v327;
  uint64_t v328;
  void *v329;
  uint64_t v330;
  void *v331;
  uint64_t v332;
  void *v333;
  uint64_t v334;
  void *v335;
  uint64_t v336;
  void *v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  void *v345;
  uint64_t v346;
  void *v347;
  uint64_t v348;
  void *v349;
  uint64_t v350;
  void *v351;
  uint64_t v352;
  void *v353;
  uint64_t v354;
  void *v355;
  uint64_t v356;
  void *v357;
  uint64_t v358;
  void *v359;
  uint64_t v360;
  void *v361;
  uint64_t v362;
  void *v363;
  uint64_t v364;
  void *v365;
  uint64_t v366;
  void *v367;
  uint64_t v368;
  void *v369;
  uint64_t v370;
  void *v371;
  uint64_t v372;
  void *v373;
  uint64_t v374;
  void *v375;
  uint64_t v376;
  void *v377;
  uint64_t v378;
  void *v379;
  uint64_t v380;
  void *v381;
  uint64_t v382;
  void *v383;
  uint64_t v384;
  void *v385;
  uint64_t v386;
  void *v387;
  uint64_t v388;
  void *v389;
  uint64_t v390;
  void *v391;
  uint64_t v392;
  void *v393;
  uint64_t v394;
  void *v395;
  uint64_t v396;
  void *v397;
  uint64_t v398;
  void *v399;
  uint64_t v400;
  void *v401;
  uint64_t v402;
  void *v403;
  uint64_t v404;
  void *v405;
  uint64_t v406;
  void *v407;
  uint64_t v408;
  void *v409;
  uint64_t v410;
  void *v411;
  uint64_t v412;
  void *v413;
  uint64_t v414;
  void *v415;
  uint64_t v416;
  void *v417;
  uint64_t v418;
  void *v419;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 1684) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_awdlElectionParameters, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_awdlMasterChannel, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_awdlOpMode, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 1657) = self->_awdlPowerState;
    *(_DWORD *)(v6 + 1684) |= 4u;
  }
  v13 = -[NSString copyWithZone:](self->_awdlSchedule, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_awdlSecondaryMasterChannel, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v15;

  v17 = -[NSString copyWithZone:](self->_awdlSyncChannelSequence, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  v19 = -[NSString copyWithZone:](self->_awdlSyncState, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v19;

  v21 = -[NSString copyWithZone:](self->_btConnectedDevicesCount, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v21;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *(_BYTE *)(v6 + 1658) = self->_btIsConnectable;
    *(_DWORD *)(v6 + 1684) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v6 + 1659) = self->_btIsDiscoverable;
  *(_DWORD *)(v6 + 1684) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_43:
  *(_BYTE *)(v6 + 1660) = self->_btIsPowerOn;
  *(_DWORD *)(v6 + 1684) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *(_BYTE *)(v6 + 1661) = self->_btIsScanning;
    *(_DWORD *)(v6 + 1684) |= 0x40u;
  }
LABEL_10:
  v24 = -[NSString copyWithZone:](self->_callingClient, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v24;

  v26 = -[NSString copyWithZone:](self->_cellularActiveContexts, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v26;

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 1662) = self->_cellularAllowsVoip;
    *(_DWORD *)(v6 + 1684) |= 0x80u;
  }
  v28 = -[NSString copyWithZone:](self->_cellularAttached, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v28;

  v30 = -[NSString copyWithZone:](self->_cellularBandinfo, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v30;

  v32 = -[NSString copyWithZone:](self->_cellularBandwidth, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v32;

  v34 = -[NSString copyWithZone:](self->_cellularCarrierName, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v34;

  v36 = -[NSString copyWithZone:](self->_cellularDataBearerSoMask, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v36;

  v38 = -[NSString copyWithZone:](self->_cellularDataBearerTechnology, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v38;

  v40 = -[NSString copyWithZone:](self->_cellularDataPlanSignalingReductionOverride, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v40;

  v42 = -[NSString copyWithZone:](self->_cellularDataPossible, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v42;

  v44 = -[NSString copyWithZone:](self->_cellularInHomeCountry, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v44;

  v46 = -[NSString copyWithZone:](self->_cellularIndicator, "copyWithZone:", a3);
  v47 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v46;

  v48 = -[NSString copyWithZone:](self->_cellularIndicatorOverride, "copyWithZone:", a3);
  v49 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v48;

  v50 = -[NSString copyWithZone:](self->_cellularIsoCountryCode, "copyWithZone:", a3);
  v51 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v50;

  v52 = -[NSString copyWithZone:](self->_cellularLqm, "copyWithZone:", a3);
  v53 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v52;

  v54 = -[NSString copyWithZone:](self->_cellularLteMaxScheduledLayers, "copyWithZone:", a3);
  v55 = *(void **)(v6 + 240);
  *(_QWORD *)(v6 + 240) = v54;

  v56 = -[NSString copyWithZone:](self->_cellularMobileCountryCode, "copyWithZone:", a3);
  v57 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v56;

  v58 = -[NSString copyWithZone:](self->_cellularMobileNetworkCode, "copyWithZone:", a3);
  v59 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v58;

  v60 = -[NSString copyWithZone:](self->_cellularNewRadioCoverage, "copyWithZone:", a3);
  v61 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v60;

  v62 = -[NSString copyWithZone:](self->_cellularNewRadioDataBearer, "copyWithZone:", a3);
  v63 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v62;

  v64 = -[NSString copyWithZone:](self->_cellularNewRadioMmwaveDataBearer, "copyWithZone:", a3);
  v65 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v64;

  v66 = -[NSString copyWithZone:](self->_cellularNewRadioNsaCoverage, "copyWithZone:", a3);
  v67 = *(void **)(v6 + 336);
  *(_QWORD *)(v6 + 336) = v66;

  v68 = -[NSString copyWithZone:](self->_cellularNewRadioNsaDataBearer, "copyWithZone:", a3);
  v69 = *(void **)(v6 + 344);
  *(_QWORD *)(v6 + 344) = v68;

  v70 = -[NSString copyWithZone:](self->_cellularNewRadioSaCoverage, "copyWithZone:", a3);
  v71 = *(void **)(v6 + 352);
  *(_QWORD *)(v6 + 352) = v70;

  v72 = -[NSString copyWithZone:](self->_cellularNewRadioSaDataBearer, "copyWithZone:", a3);
  v73 = *(void **)(v6 + 360);
  *(_QWORD *)(v6 + 360) = v72;

  v74 = -[NSString copyWithZone:](self->_cellularNewRadioSub6DataBearer, "copyWithZone:", a3);
  v75 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v74;

  v76 = -[NSString copyWithZone:](self->_cellularNrConfiguredBw, "copyWithZone:", a3);
  v77 = *(void **)(v6 + 376);
  *(_QWORD *)(v6 + 376) = v76;

  v78 = -[NSString copyWithZone:](self->_cellularNrLayers, "copyWithZone:", a3);
  v79 = *(void **)(v6 + 384);
  *(_QWORD *)(v6 + 384) = v78;

  v80 = -[NSString copyWithZone:](self->_cellularNrModulation, "copyWithZone:", a3);
  v81 = *(void **)(v6 + 392);
  *(_QWORD *)(v6 + 392) = v80;

  v82 = -[NSString copyWithZone:](self->_cellularNrRsrp, "copyWithZone:", a3);
  v83 = *(void **)(v6 + 400);
  *(_QWORD *)(v6 + 400) = v82;

  v84 = -[NSString copyWithZone:](self->_cellularNrRsrq, "copyWithZone:", a3);
  v85 = *(void **)(v6 + 408);
  *(_QWORD *)(v6 + 408) = v84;

  v86 = -[NSString copyWithZone:](self->_cellularNrSnr, "copyWithZone:", a3);
  v87 = *(void **)(v6 + 424);
  *(_QWORD *)(v6 + 424) = v86;

  v88 = -[NSString copyWithZone:](self->_cellularPid, "copyWithZone:", a3);
  v89 = *(void **)(v6 + 440);
  *(_QWORD *)(v6 + 440) = v88;

  v90 = -[NSString copyWithZone:](self->_cellularRadioAccessTechnology, "copyWithZone:", a3);
  v91 = *(void **)(v6 + 448);
  *(_QWORD *)(v6 + 448) = v90;

  v92 = -[NSString copyWithZone:](self->_cellularRadioAccessTechnologyCtDataStatus, "copyWithZone:", a3);
  v93 = *(void **)(v6 + 456);
  *(_QWORD *)(v6 + 456) = v92;

  v94 = -[NSString copyWithZone:](self->_cellularRoamAllowed, "copyWithZone:", a3);
  v95 = *(void **)(v6 + 488);
  *(_QWORD *)(v6 + 488) = v94;

  v96 = -[NSString copyWithZone:](self->_cellularRsrp, "copyWithZone:", a3);
  v97 = *(void **)(v6 + 496);
  *(_QWORD *)(v6 + 496) = v96;

  v98 = -[NSString copyWithZone:](self->_cellularSnr, "copyWithZone:", a3);
  v99 = *(void **)(v6 + 504);
  *(_QWORD *)(v6 + 504) = v98;

  v100 = -[NSString copyWithZone:](self->_cellularTac, "copyWithZone:", a3);
  v101 = *(void **)(v6 + 512);
  *(_QWORD *)(v6 + 512) = v100;

  v102 = -[NSString copyWithZone:](self->_cellularTotalActiveContexts, "copyWithZone:", a3);
  v103 = *(void **)(v6 + 520);
  *(_QWORD *)(v6 + 520) = v102;

  v104 = -[NSString copyWithZone:](self->_cellularTotalBw, "copyWithZone:", a3);
  v105 = *(void **)(v6 + 528);
  *(_QWORD *)(v6 + 528) = v104;

  v106 = -[NSString copyWithZone:](self->_cellularTotalCcs, "copyWithZone:", a3);
  v107 = *(void **)(v6 + 536);
  *(_QWORD *)(v6 + 536) = v106;

  v108 = -[NSString copyWithZone:](self->_cellularTotalLayers, "copyWithZone:", a3);
  v109 = *(void **)(v6 + 552);
  *(_QWORD *)(v6 + 552) = v108;

  v110 = -[NSString copyWithZone:](self->_cellularUarfcn, "copyWithZone:", a3);
  v111 = *(void **)(v6 + 568);
  *(_QWORD *)(v6 + 568) = v110;

  v112 = -[NSString copyWithZone:](self->_downloadCdnPop, "copyWithZone:", a3);
  v113 = *(void **)(v6 + 576);
  *(_QWORD *)(v6 + 576) = v112;

  v114 = -[NSString copyWithZone:](self->_downloadCdnUuid, "copyWithZone:", a3);
  v115 = *(void **)(v6 + 584);
  *(_QWORD *)(v6 + 584) = v114;

  v116 = -[NSString copyWithZone:](self->_downloadConnectionTime, "copyWithZone:", a3);
  v117 = *(void **)(v6 + 592);
  *(_QWORD *)(v6 + 592) = v116;

  v118 = -[NSString copyWithZone:](self->_downloadDomainLookupTime, "copyWithZone:", a3);
  v119 = *(void **)(v6 + 600);
  *(_QWORD *)(v6 + 600) = v118;

  v120 = -[NSString copyWithZone:](self->_downloadEndDataBearerTechnology, "copyWithZone:", a3);
  v121 = *(void **)(v6 + 616);
  *(_QWORD *)(v6 + 616) = v120;

  v122 = -[NSString copyWithZone:](self->_downloadEndPrimaryIpv4Interface, "copyWithZone:", a3);
  v123 = *(void **)(v6 + 624);
  *(_QWORD *)(v6 + 624) = v122;

  v124 = -[NSString copyWithZone:](self->_downloadEndRat, "copyWithZone:", a3);
  v125 = *(void **)(v6 + 640);
  *(_QWORD *)(v6 + 640) = v124;

  v126 = -[NSString copyWithZone:](self->_downloadFileSize, "copyWithZone:", a3);
  v127 = *(void **)(v6 + 672);
  *(_QWORD *)(v6 + 672) = v126;

  v128 = -[NSString copyWithZone:](self->_downloadInterfaceName, "copyWithZone:", a3);
  v129 = *(void **)(v6 + 680);
  *(_QWORD *)(v6 + 680) = v128;

  v130 = -[NSString copyWithZone:](self->_downloadInterfaceServiceName, "copyWithZone:", a3);
  v131 = *(void **)(v6 + 688);
  *(_QWORD *)(v6 + 688) = v130;

  v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x200) != 0)
  {
    *(_BYTE *)(v6 + 1664) = self->_downloadIsCellular;
    *(_DWORD *)(v6 + 1684) |= 0x200u;
    v132 = self->_has;
    if ((*(_WORD *)&v132 & 0x400) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v132 & 0x800) == 0)
        goto LABEL_15;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v132 & 0x400) == 0)
  {
    goto LABEL_14;
  }
  *(_BYTE *)(v6 + 1665) = self->_downloadIsConstrained;
  *(_DWORD *)(v6 + 1684) |= 0x400u;
  v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v132 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v6 + 1666) = self->_downloadIsExpensive;
  *(_DWORD *)(v6 + 1684) |= 0x800u;
  v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v132 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v6 + 1667) = self->_downloadIsMultipath;
  *(_DWORD *)(v6 + 1684) |= 0x1000u;
  v132 = self->_has;
  if ((*(_WORD *)&v132 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v132 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_49:
  *(_BYTE *)(v6 + 1668) = self->_downloadIsProxyConnection;
  *(_DWORD *)(v6 + 1684) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *(_BYTE *)(v6 + 1669) = self->_downloadIsReusedConnection;
    *(_DWORD *)(v6 + 1684) |= 0x4000u;
  }
LABEL_19:
  v133 = -[NSString copyWithZone:](self->_downloadMaxSpeedObserved, "copyWithZone:", a3);
  v134 = *(void **)(v6 + 704);
  *(_QWORD *)(v6 + 704) = v133;

  v135 = -[NSString copyWithZone:](self->_downloadNumberOfStreams, "copyWithZone:", a3);
  v136 = *(void **)(v6 + 712);
  *(_QWORD *)(v6 + 712) = v135;

  v137 = -[NSString copyWithZone:](self->_downloadProtocolName, "copyWithZone:", a3);
  v138 = *(void **)(v6 + 720);
  *(_QWORD *)(v6 + 720) = v137;

  v139 = -[NSString copyWithZone:](self->_downloadRemoteAddress, "copyWithZone:", a3);
  v140 = *(void **)(v6 + 728);
  *(_QWORD *)(v6 + 728) = v139;

  v141 = -[NSString copyWithZone:](self->_downloadRemotePort, "copyWithZone:", a3);
  v142 = *(void **)(v6 + 736);
  *(_QWORD *)(v6 + 736) = v141;

  v143 = -[NSString copyWithZone:](self->_downloadRequestTime, "copyWithZone:", a3);
  v144 = *(void **)(v6 + 744);
  *(_QWORD *)(v6 + 744) = v143;

  v145 = -[NSString copyWithZone:](self->_downloadRequestToResponseTime, "copyWithZone:", a3);
  v146 = *(void **)(v6 + 752);
  *(_QWORD *)(v6 + 752) = v145;

  v147 = -[NSString copyWithZone:](self->_downloadResponseTime, "copyWithZone:", a3);
  v148 = *(void **)(v6 + 760);
  *(_QWORD *)(v6 + 760) = v147;

  v149 = -[NSString copyWithZone:](self->_downloadSecureConnectionTime, "copyWithZone:", a3);
  v150 = *(void **)(v6 + 792);
  *(_QWORD *)(v6 + 792) = v149;

  v151 = -[NSString copyWithZone:](self->_downloadServer, "copyWithZone:", a3);
  v152 = *(void **)(v6 + 800);
  *(_QWORD *)(v6 + 800) = v151;

  v153 = -[NSString copyWithZone:](self->_downloadSpeed, "copyWithZone:", a3);
  v154 = *(void **)(v6 + 808);
  *(_QWORD *)(v6 + 808) = v153;

  v155 = -[NSString copyWithZone:](self->_downloadStableSpeed, "copyWithZone:", a3);
  v156 = *(void **)(v6 + 832);
  *(_QWORD *)(v6 + 832) = v155;

  v157 = -[NSString copyWithZone:](self->_downloadStartDataBearerTechnology, "copyWithZone:", a3);
  v158 = *(void **)(v6 + 848);
  *(_QWORD *)(v6 + 848) = v157;

  v159 = -[NSString copyWithZone:](self->_downloadStartPrimaryIpv4Interface, "copyWithZone:", a3);
  v160 = *(void **)(v6 + 856);
  *(_QWORD *)(v6 + 856) = v159;

  v161 = -[NSString copyWithZone:](self->_downloadStartRat, "copyWithZone:", a3);
  v162 = *(void **)(v6 + 872);
  *(_QWORD *)(v6 + 872) = v161;

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 1670) = self->_networkIsAppleReachable;
    *(_DWORD *)(v6 + 1684) |= 0x8000u;
  }
  v163 = -[NSString copyWithZone:](self->_networkPrimaryIpv4InterfaceName, "copyWithZone:", a3);
  v164 = *(void **)(v6 + 880);
  *(_QWORD *)(v6 + 880) = v163;

  v165 = -[NSString copyWithZone:](self->_networkPrimaryIpv4ServiceName, "copyWithZone:", a3);
  v166 = *(void **)(v6 + 888);
  *(_QWORD *)(v6 + 888) = v165;

  v167 = -[NSString copyWithZone:](self->_nptkitFrameworkVersion, "copyWithZone:", a3);
  v168 = *(void **)(v6 + 968);
  *(_QWORD *)(v6 + 968) = v167;

  v169 = -[NSString copyWithZone:](self->_performanceTestStartTime, "copyWithZone:", a3);
  v170 = *(void **)(v6 + 976);
  *(_QWORD *)(v6 + 976) = v169;

  v171 = -[NSString copyWithZone:](self->_pingAddress, "copyWithZone:", a3);
  v172 = *(void **)(v6 + 984);
  *(_QWORD *)(v6 + 984) = v171;

  v173 = -[NSString copyWithZone:](self->_pingLossPercent, "copyWithZone:", a3);
  v174 = *(void **)(v6 + 1016);
  *(_QWORD *)(v6 + 1016) = v173;

  v175 = -[NSString copyWithZone:](self->_pingMaxLatency, "copyWithZone:", a3);
  v176 = *(void **)(v6 + 1024);
  *(_QWORD *)(v6 + 1024) = v175;

  v177 = -[NSString copyWithZone:](self->_pingMeanLatency, "copyWithZone:", a3);
  v178 = *(void **)(v6 + 1032);
  *(_QWORD *)(v6 + 1032) = v177;

  v179 = -[NSString copyWithZone:](self->_pingMinLatency, "copyWithZone:", a3);
  v180 = *(void **)(v6 + 1040);
  *(_QWORD *)(v6 + 1040) = v179;

  v181 = -[NSString copyWithZone:](self->_pingStandardDeviation, "copyWithZone:", a3);
  v182 = *(void **)(v6 + 1048);
  *(_QWORD *)(v6 + 1048) = v181;

  v183 = -[NSString copyWithZone:](self->_powerBatteryWarningLevel, "copyWithZone:", a3);
  v184 = *(void **)(v6 + 1056);
  *(_QWORD *)(v6 + 1056) = v183;

  v185 = -[NSString copyWithZone:](self->_powerSourceType, "copyWithZone:", a3);
  v186 = *(void **)(v6 + 1064);
  *(_QWORD *)(v6 + 1064) = v185;

  v187 = -[NSString copyWithZone:](self->_powerStateCaps, "copyWithZone:", a3);
  v188 = *(void **)(v6 + 1072);
  *(_QWORD *)(v6 + 1072) = v187;

  v189 = -[NSString copyWithZone:](self->_systemActiveProcessorCount, "copyWithZone:", a3);
  v190 = *(void **)(v6 + 1080);
  *(_QWORD *)(v6 + 1080) = v189;

  v191 = -[NSString copyWithZone:](self->_systemBatteryLevel, "copyWithZone:", a3);
  v192 = *(void **)(v6 + 1088);
  *(_QWORD *)(v6 + 1088) = v191;

  v193 = -[NSString copyWithZone:](self->_systemBatteryState, "copyWithZone:", a3);
  v194 = *(void **)(v6 + 1096);
  *(_QWORD *)(v6 + 1096) = v193;

  v195 = -[NSString copyWithZone:](self->_systemDeviceClass, "copyWithZone:", a3);
  v196 = *(void **)(v6 + 1104);
  *(_QWORD *)(v6 + 1104) = v195;

  v197 = -[NSString copyWithZone:](self->_systemDeviceModel, "copyWithZone:", a3);
  v198 = *(void **)(v6 + 1112);
  *(_QWORD *)(v6 + 1112) = v197;

  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_BYTE *)(v6 + 1671) = self->_systemLowPowerModeEnabled;
    *(_DWORD *)(v6 + 1684) |= 0x10000u;
  }
  v199 = -[NSString copyWithZone:](self->_systemName, "copyWithZone:", a3);
  v200 = *(void **)(v6 + 1120);
  *(_QWORD *)(v6 + 1120) = v199;

  v201 = -[NSString copyWithZone:](self->_systemOsVariant, "copyWithZone:", a3);
  v202 = *(void **)(v6 + 1128);
  *(_QWORD *)(v6 + 1128) = v201;

  v203 = -[NSString copyWithZone:](self->_systemPhysicalMemory, "copyWithZone:", a3);
  v204 = *(void **)(v6 + 1136);
  *(_QWORD *)(v6 + 1136) = v203;

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_BYTE *)(v6 + 1672) = self->_systemPowersourceConnected;
    *(_DWORD *)(v6 + 1684) |= 0x20000u;
  }
  v205 = -[NSString copyWithZone:](self->_systemProcessorCount, "copyWithZone:", a3);
  v206 = *(void **)(v6 + 1144);
  *(_QWORD *)(v6 + 1144) = v205;

  v207 = -[NSString copyWithZone:](self->_systemVersion, "copyWithZone:", a3);
  v208 = *(void **)(v6 + 1152);
  *(_QWORD *)(v6 + 1152) = v207;

  v209 = -[NSString copyWithZone:](self->_uploadCdnPop, "copyWithZone:", a3);
  v210 = *(void **)(v6 + 1160);
  *(_QWORD *)(v6 + 1160) = v209;

  v211 = -[NSString copyWithZone:](self->_uploadCdnUuid, "copyWithZone:", a3);
  v212 = *(void **)(v6 + 1168);
  *(_QWORD *)(v6 + 1168) = v211;

  v213 = -[NSString copyWithZone:](self->_uploadConnectionTime, "copyWithZone:", a3);
  v214 = *(void **)(v6 + 1176);
  *(_QWORD *)(v6 + 1176) = v213;

  v215 = -[NSString copyWithZone:](self->_uploadDomainLookupTime, "copyWithZone:", a3);
  v216 = *(void **)(v6 + 1184);
  *(_QWORD *)(v6 + 1184) = v215;

  v217 = -[NSString copyWithZone:](self->_uploadEndDataBearerTechnology, "copyWithZone:", a3);
  v218 = *(void **)(v6 + 1200);
  *(_QWORD *)(v6 + 1200) = v217;

  v219 = -[NSString copyWithZone:](self->_uploadEndPrimaryIpv4Interface, "copyWithZone:", a3);
  v220 = *(void **)(v6 + 1208);
  *(_QWORD *)(v6 + 1208) = v219;

  v221 = -[NSString copyWithZone:](self->_uploadEndRat, "copyWithZone:", a3);
  v222 = *(void **)(v6 + 1224);
  *(_QWORD *)(v6 + 1224) = v221;

  v223 = -[NSString copyWithZone:](self->_uploadFileSize, "copyWithZone:", a3);
  v224 = *(void **)(v6 + 1256);
  *(_QWORD *)(v6 + 1256) = v223;

  v225 = -[NSString copyWithZone:](self->_uploadInterfaceName, "copyWithZone:", a3);
  v226 = *(void **)(v6 + 1264);
  *(_QWORD *)(v6 + 1264) = v225;

  v227 = -[NSString copyWithZone:](self->_uploadInterfaceServiceName, "copyWithZone:", a3);
  v228 = *(void **)(v6 + 1272);
  *(_QWORD *)(v6 + 1272) = v227;

  v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x40000) != 0)
  {
    *(_BYTE *)(v6 + 1673) = self->_uploadIsCellular;
    *(_DWORD *)(v6 + 1684) |= 0x40000u;
    v229 = self->_has;
    if ((*(_DWORD *)&v229 & 0x80000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&v229 & 0x100000) == 0)
        goto LABEL_28;
      goto LABEL_53;
    }
  }
  else if ((*(_DWORD *)&v229 & 0x80000) == 0)
  {
    goto LABEL_27;
  }
  *(_BYTE *)(v6 + 1674) = self->_uploadIsConstrained;
  *(_DWORD *)(v6 + 1684) |= 0x80000u;
  v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v229 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_54;
  }
LABEL_53:
  *(_BYTE *)(v6 + 1675) = self->_uploadIsExpensive;
  *(_DWORD *)(v6 + 1684) |= 0x100000u;
  v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v229 & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v6 + 1676) = self->_uploadIsMultipath;
  *(_DWORD *)(v6 + 1684) |= 0x200000u;
  v229 = self->_has;
  if ((*(_DWORD *)&v229 & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v229 & 0x800000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_55:
  *(_BYTE *)(v6 + 1677) = self->_uploadIsProxyConnection;
  *(_DWORD *)(v6 + 1684) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_31:
    *(_BYTE *)(v6 + 1678) = self->_uploadIsReusedConnection;
    *(_DWORD *)(v6 + 1684) |= 0x800000u;
  }
LABEL_32:
  v230 = -[NSString copyWithZone:](self->_uploadMaxSpeedObserved, "copyWithZone:", a3);
  v231 = *(void **)(v6 + 1288);
  *(_QWORD *)(v6 + 1288) = v230;

  v232 = -[NSString copyWithZone:](self->_uploadNumberOfStreams, "copyWithZone:", a3);
  v233 = *(void **)(v6 + 1296);
  *(_QWORD *)(v6 + 1296) = v232;

  v234 = -[NSString copyWithZone:](self->_uploadProtocolName, "copyWithZone:", a3);
  v235 = *(void **)(v6 + 1304);
  *(_QWORD *)(v6 + 1304) = v234;

  v236 = -[NSString copyWithZone:](self->_uploadRemoteAddress, "copyWithZone:", a3);
  v237 = *(void **)(v6 + 1312);
  *(_QWORD *)(v6 + 1312) = v236;

  v238 = -[NSString copyWithZone:](self->_uploadRemotePort, "copyWithZone:", a3);
  v239 = *(void **)(v6 + 1320);
  *(_QWORD *)(v6 + 1320) = v238;

  v240 = -[NSString copyWithZone:](self->_uploadRequestTime, "copyWithZone:", a3);
  v241 = *(void **)(v6 + 1328);
  *(_QWORD *)(v6 + 1328) = v240;

  v242 = -[NSString copyWithZone:](self->_uploadRequestToResponseTime, "copyWithZone:", a3);
  v243 = *(void **)(v6 + 1336);
  *(_QWORD *)(v6 + 1336) = v242;

  v244 = -[NSString copyWithZone:](self->_uploadResponseTime, "copyWithZone:", a3);
  v245 = *(void **)(v6 + 1344);
  *(_QWORD *)(v6 + 1344) = v244;

  v246 = -[NSString copyWithZone:](self->_uploadSecureConnectionTime, "copyWithZone:", a3);
  v247 = *(void **)(v6 + 1376);
  *(_QWORD *)(v6 + 1376) = v246;

  v248 = -[NSString copyWithZone:](self->_uploadServer, "copyWithZone:", a3);
  v249 = *(void **)(v6 + 1384);
  *(_QWORD *)(v6 + 1384) = v248;

  v250 = -[NSString copyWithZone:](self->_uploadSpeed, "copyWithZone:", a3);
  v251 = *(void **)(v6 + 1392);
  *(_QWORD *)(v6 + 1392) = v250;

  v252 = -[NSString copyWithZone:](self->_uploadStableSpeed, "copyWithZone:", a3);
  v253 = *(void **)(v6 + 1416);
  *(_QWORD *)(v6 + 1416) = v252;

  v254 = -[NSString copyWithZone:](self->_uploadStartDataBearerTechnology, "copyWithZone:", a3);
  v255 = *(void **)(v6 + 1432);
  *(_QWORD *)(v6 + 1432) = v254;

  v256 = -[NSString copyWithZone:](self->_uploadStartPrimaryIpv4Interface, "copyWithZone:", a3);
  v257 = *(void **)(v6 + 1440);
  *(_QWORD *)(v6 + 1440) = v256;

  v258 = -[NSString copyWithZone:](self->_uploadStartRat, "copyWithZone:", a3);
  v259 = *(void **)(v6 + 1456);
  *(_QWORD *)(v6 + 1456) = v258;

  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *(_BYTE *)(v6 + 1679) = self->_useWifiWasSpecified;
    *(_DWORD *)(v6 + 1684) |= 0x1000000u;
  }
  v260 = -[NSString copyWithZone:](self->_wifiAveragePhyRateRx, "copyWithZone:", a3);
  v261 = *(void **)(v6 + 1472);
  *(_QWORD *)(v6 + 1472) = v260;

  v262 = -[NSString copyWithZone:](self->_wifiAverageRssi, "copyWithZone:", a3);
  v263 = *(void **)(v6 + 1480);
  *(_QWORD *)(v6 + 1480) = v262;

  v264 = -[NSString copyWithZone:](self->_wifiAverageSnr, "copyWithZone:", a3);
  v265 = *(void **)(v6 + 1488);
  *(_QWORD *)(v6 + 1488) = v264;

  v266 = -[NSString copyWithZone:](self->_wifiAverageTcpRtt, "copyWithZone:", a3);
  v267 = *(void **)(v6 + 1496);
  *(_QWORD *)(v6 + 1496) = v266;

  v268 = -[NSString copyWithZone:](self->_wifiBtcMode, "copyWithZone:", a3);
  v269 = *(void **)(v6 + 1504);
  *(_QWORD *)(v6 + 1504) = v268;

  v270 = -[NSString copyWithZone:](self->_wifiCca, "copyWithZone:", a3);
  v271 = *(void **)(v6 + 1512);
  *(_QWORD *)(v6 + 1512) = v270;

  v272 = -[NSString copyWithZone:](self->_wifiChannel, "copyWithZone:", a3);
  v273 = *(void **)(v6 + 1520);
  *(_QWORD *)(v6 + 1520) = v272;

  v274 = -[NSString copyWithZone:](self->_wifiCwfCca, "copyWithZone:", a3);
  v275 = *(void **)(v6 + 1544);
  *(_QWORD *)(v6 + 1544) = v274;

  v276 = -[NSString copyWithZone:](self->_wifiEapolControlMode, "copyWithZone:", a3);
  v277 = *(void **)(v6 + 1552);
  *(_QWORD *)(v6 + 1552) = v276;

  v278 = -[NSString copyWithZone:](self->_wifiEapolSupplicantState, "copyWithZone:", a3);
  v279 = *(void **)(v6 + 1560);
  *(_QWORD *)(v6 + 1560) = v278;

  v280 = -[NSString copyWithZone:](self->_wifiGuardInterval, "copyWithZone:", a3);
  v281 = *(void **)(v6 + 1568);
  *(_QWORD *)(v6 + 1568) = v280;

  v282 = -[NSString copyWithZone:](self->_wifiHiddenState, "copyWithZone:", a3);
  v283 = *(void **)(v6 + 1576);
  *(_QWORD *)(v6 + 1576) = v282;

  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    *(_BYTE *)(v6 + 1680) = self->_wifiIsCaptive;
    *(_DWORD *)(v6 + 1684) |= 0x2000000u;
  }
  v284 = -[NSString copyWithZone:](self->_wifiMcsIndex, "copyWithZone:", a3);
  v285 = *(void **)(v6 + 1584);
  *(_QWORD *)(v6 + 1584) = v284;

  v286 = -[NSString copyWithZone:](self->_wifiNoise, "copyWithZone:", a3);
  v287 = *(void **)(v6 + 1592);
  *(_QWORD *)(v6 + 1592) = v286;

  v288 = -[NSString copyWithZone:](self->_wifiNumberOfSpatialStreams, "copyWithZone:", a3);
  v289 = *(void **)(v6 + 1600);
  *(_QWORD *)(v6 + 1600) = v288;

  v290 = -[NSString copyWithZone:](self->_wifiOpMode, "copyWithZone:", a3);
  v291 = *(void **)(v6 + 1608);
  *(_QWORD *)(v6 + 1608) = v290;

  v292 = -[NSString copyWithZone:](self->_wifiPhyMode, "copyWithZone:", a3);
  v293 = *(void **)(v6 + 1616);
  *(_QWORD *)(v6 + 1616) = v292;

  v294 = -[NSString copyWithZone:](self->_wifiRssi, "copyWithZone:", a3);
  v295 = *(void **)(v6 + 1624);
  *(_QWORD *)(v6 + 1624) = v294;

  v296 = -[NSString copyWithZone:](self->_wifiSecurity, "copyWithZone:", a3);
  v297 = *(void **)(v6 + 1632);
  *(_QWORD *)(v6 + 1632) = v296;

  v298 = -[NSString copyWithZone:](self->_wifiTxRate, "copyWithZone:", a3);
  v299 = *(void **)(v6 + 1640);
  *(_QWORD *)(v6 + 1640) = v298;

  v300 = -[NSString copyWithZone:](self->_wrmChannelType, "copyWithZone:", a3);
  v301 = *(void **)(v6 + 1648);
  *(_QWORD *)(v6 + 1648) = v300;

  v302 = -[NSString copyWithZone:](self->_cellularCellid, "copyWithZone:", a3);
  v303 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v302;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 1656) = self->_acceptablePerformanceResult;
    *(_DWORD *)(v6 + 1684) |= 2u;
  }
  v304 = -[NSString copyWithZone:](self->_networkQualityResponsiveness, "copyWithZone:", a3);
  v305 = *(void **)(v6 + 952);
  *(_QWORD *)(v6 + 952) = v304;

  v306 = -[NSString copyWithZone:](self->_cellularAggregatedDLBW, "copyWithZone:", a3);
  v307 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v306;

  v308 = -[NSString copyWithZone:](self->_cellularAggregatedULBW, "copyWithZone:", a3);
  v309 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v308;

  v310 = -[NSString copyWithZone:](self->_cellularIssa, "copyWithZone:", a3);
  v311 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v310;

  v312 = -[NSString copyWithZone:](self->_cellularLac, "copyWithZone:", a3);
  v313 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v312;

  v314 = -[NSString copyWithZone:](self->_cellularLteNrConfiguredBw, "copyWithZone:", a3);
  v315 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v314;

  v316 = -[NSString copyWithZone:](self->_cellularMaxDlMod, "copyWithZone:", a3);
  v317 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v316;

  v318 = -[NSString copyWithZone:](self->_cellularMaxNwMimoLyr, "copyWithZone:", a3);
  v319 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v318;

  v320 = -[NSString copyWithZone:](self->_cellularMaxSchdMimoLyr, "copyWithZone:", a3);
  v321 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v320;

  v322 = -[NSString copyWithZone:](self->_cellularMaxUeRank, "copyWithZone:", a3);
  v323 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v322;

  v324 = -[NSString copyWithZone:](self->_cellularMaxUlMod, "copyWithZone:", a3);
  v325 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v324;

  v326 = -[NSString copyWithZone:](self->_cellularNrSinr, "copyWithZone:", a3);
  v327 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v326;

  v328 = -[NSString copyWithZone:](self->_cellularNrarfcn, "copyWithZone:", a3);
  v329 = *(void **)(v6 + 432);
  *(_QWORD *)(v6 + 432) = v328;

  v330 = -[NSString copyWithZone:](self->_cellularRadioFrequency, "copyWithZone:", a3);
  v331 = *(void **)(v6 + 464);
  *(_QWORD *)(v6 + 464) = v330;

  v332 = -[NSString copyWithZone:](self->_cellularTotalDlMimoLayers, "copyWithZone:", a3);
  v333 = *(void **)(v6 + 544);
  *(_QWORD *)(v6 + 544) = v332;

  v334 = -[NSString copyWithZone:](self->_cellularTotalNumCcs, "copyWithZone:", a3);
  v335 = *(void **)(v6 + 560);
  *(_QWORD *)(v6 + 560) = v334;

  v336 = -[NSString copyWithZone:](self->_downloadStartRadioFrequency, "copyWithZone:", a3);
  v337 = *(void **)(v6 + 864);
  *(_QWORD *)(v6 + 864) = v336;

  v338 = -[NSString copyWithZone:](self->_downloadEndRadioFrequency, "copyWithZone:", a3);
  v339 = *(void **)(v6 + 632);
  *(_QWORD *)(v6 + 632) = v338;

  v340 = -[NSString copyWithZone:](self->_networkPrimaryIpv6InterfaceName, "copyWithZone:", a3);
  v341 = *(void **)(v6 + 896);
  *(_QWORD *)(v6 + 896) = v340;

  v342 = -[NSString copyWithZone:](self->_networkPrimaryIpv6ServiceName, "copyWithZone:", a3);
  v343 = *(void **)(v6 + 904);
  *(_QWORD *)(v6 + 904) = v342;

  v344 = -[NSString copyWithZone:](self->_uploadStartRadioFrequency, "copyWithZone:", a3);
  v345 = *(void **)(v6 + 1448);
  *(_QWORD *)(v6 + 1448) = v344;

  v346 = -[NSString copyWithZone:](self->_uploadEndRadioFrequency, "copyWithZone:", a3);
  v347 = *(void **)(v6 + 1216);
  *(_QWORD *)(v6 + 1216) = v346;

  v348 = -[NSString copyWithZone:](self->_downloadError, "copyWithZone:", a3);
  v349 = *(void **)(v6 + 648);
  *(_QWORD *)(v6 + 648) = v348;

  v350 = -[NSString copyWithZone:](self->_networkQualityError, "copyWithZone:", a3);
  v351 = *(void **)(v6 + 920);
  *(_QWORD *)(v6 + 920) = v350;

  v352 = -[NSString copyWithZone:](self->_networkQualityDownloadSpeed, "copyWithZone:", a3);
  v353 = *(void **)(v6 + 912);
  *(_QWORD *)(v6 + 912) = v352;

  v354 = -[NSString copyWithZone:](self->_networkQualityUploadSpeed, "copyWithZone:", a3);
  v355 = *(void **)(v6 + 960);
  *(_QWORD *)(v6 + 960) = v354;

  v356 = -[NSString copyWithZone:](self->_networkQualityRating, "copyWithZone:", a3);
  v357 = *(void **)(v6 + 944);
  *(_QWORD *)(v6 + 944) = v356;

  v358 = -[NSString copyWithZone:](self->_vpnConnectionState, "copyWithZone:", a3);
  v359 = *(void **)(v6 + 1464);
  *(_QWORD *)(v6 + 1464) = v358;

  v360 = -[NSString copyWithZone:](self->_uploadError, "copyWithZone:", a3);
  v361 = *(void **)(v6 + 1232);
  *(_QWORD *)(v6 + 1232) = v360;

  v362 = -[NSString copyWithZone:](self->_uploadErrorDomain, "copyWithZone:", a3);
  v363 = *(void **)(v6 + 1248);
  *(_QWORD *)(v6 + 1248) = v362;

  v364 = -[NSString copyWithZone:](self->_uploadErrorCode, "copyWithZone:", a3);
  v365 = *(void **)(v6 + 1240);
  *(_QWORD *)(v6 + 1240) = v364;

  v366 = -[NSString copyWithZone:](self->_downloadErrorDomain, "copyWithZone:", a3);
  v367 = *(void **)(v6 + 664);
  *(_QWORD *)(v6 + 664) = v366;

  v368 = -[NSString copyWithZone:](self->_downloadErrorCode, "copyWithZone:", a3);
  v369 = *(void **)(v6 + 656);
  *(_QWORD *)(v6 + 656) = v368;

  v370 = -[NSString copyWithZone:](self->_pingError, "copyWithZone:", a3);
  v371 = *(void **)(v6 + 992);
  *(_QWORD *)(v6 + 992) = v370;

  v372 = -[NSString copyWithZone:](self->_pingErrorDomain, "copyWithZone:", a3);
  v373 = *(void **)(v6 + 1008);
  *(_QWORD *)(v6 + 1008) = v372;

  v374 = -[NSString copyWithZone:](self->_pingErrorCode, "copyWithZone:", a3);
  v375 = *(void **)(v6 + 1000);
  *(_QWORD *)(v6 + 1000) = v374;

  v376 = -[NSString copyWithZone:](self->_networkQualityErrorDomain, "copyWithZone:", a3);
  v377 = *(void **)(v6 + 936);
  *(_QWORD *)(v6 + 936) = v376;

  v378 = -[NSString copyWithZone:](self->_networkQualityErrorCode, "copyWithZone:", a3);
  v379 = *(void **)(v6 + 928);
  *(_QWORD *)(v6 + 928) = v378;

  v380 = -[NSString copyWithZone:](self->_cellularRnMobileCountryCode, "copyWithZone:", a3);
  v381 = *(void **)(v6 + 472);
  *(_QWORD *)(v6 + 472) = v380;

  v382 = -[NSString copyWithZone:](self->_cellularRnMobileNetworkCode, "copyWithZone:", a3);
  v383 = *(void **)(v6 + 480);
  *(_QWORD *)(v6 + 480) = v382;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_BYTE *)(v6 + 1663) = self->_cellularDataIsEnabled;
    *(_DWORD *)(v6 + 1684) |= 0x100u;
  }
  v384 = -[NSString copyWithZone:](self->_downloadStartCellularEstimate, "copyWithZone:", a3);
  v385 = *(void **)(v6 + 840);
  *(_QWORD *)(v6 + 840) = v384;

  v386 = -[NSString copyWithZone:](self->_downloadEndCellularEstimate, "copyWithZone:", a3);
  v387 = *(void **)(v6 + 608);
  *(_QWORD *)(v6 + 608) = v386;

  v388 = -[NSString copyWithZone:](self->_downloadMaxCellularEstimate, "copyWithZone:", a3);
  v389 = *(void **)(v6 + 696);
  *(_QWORD *)(v6 + 696) = v388;

  v390 = -[NSString copyWithZone:](self->_uploadStartCellularEstimate, "copyWithZone:", a3);
  v391 = *(void **)(v6 + 1424);
  *(_QWORD *)(v6 + 1424) = v390;

  v392 = -[NSString copyWithZone:](self->_uploadEndCellularEstimate, "copyWithZone:", a3);
  v393 = *(void **)(v6 + 1192);
  *(_QWORD *)(v6 + 1192) = v392;

  v394 = -[NSString copyWithZone:](self->_uploadMaxCellularEstimate, "copyWithZone:", a3);
  v395 = *(void **)(v6 + 1280);
  *(_QWORD *)(v6 + 1280) = v394;

  v396 = -[NSString copyWithZone:](self->_downloadResponsiveness, "copyWithZone:", a3);
  v397 = *(void **)(v6 + 768);
  *(_QWORD *)(v6 + 768) = v396;

  v398 = -[NSString copyWithZone:](self->_downloadResponsivenessConfidence, "copyWithZone:", a3);
  v399 = *(void **)(v6 + 776);
  *(_QWORD *)(v6 + 776) = v398;

  v400 = -[NSString copyWithZone:](self->_downloadResponsivenessRating, "copyWithZone:", a3);
  v401 = *(void **)(v6 + 784);
  *(_QWORD *)(v6 + 784) = v400;

  v402 = -[NSString copyWithZone:](self->_downloadSpeedConfidence, "copyWithZone:", a3);
  v403 = *(void **)(v6 + 816);
  *(_QWORD *)(v6 + 816) = v402;

  v404 = -[NSString copyWithZone:](self->_downloadSpeedRating, "copyWithZone:", a3);
  v405 = *(void **)(v6 + 824);
  *(_QWORD *)(v6 + 824) = v404;

  v406 = -[NSString copyWithZone:](self->_uploadResponsiveness, "copyWithZone:", a3);
  v407 = *(void **)(v6 + 1352);
  *(_QWORD *)(v6 + 1352) = v406;

  v408 = -[NSString copyWithZone:](self->_uploadResponsivenessConfidence, "copyWithZone:", a3);
  v409 = *(void **)(v6 + 1360);
  *(_QWORD *)(v6 + 1360) = v408;

  v410 = -[NSString copyWithZone:](self->_uploadResponsivenessRating, "copyWithZone:", a3);
  v411 = *(void **)(v6 + 1368);
  *(_QWORD *)(v6 + 1368) = v410;

  v412 = -[NSString copyWithZone:](self->_uploadSpeedConfidence, "copyWithZone:", a3);
  v413 = *(void **)(v6 + 1400);
  *(_QWORD *)(v6 + 1400) = v412;

  v414 = -[NSString copyWithZone:](self->_uploadSpeedRating, "copyWithZone:", a3);
  v415 = *(void **)(v6 + 1408);
  *(_QWORD *)(v6 + 1408) = v414;

  v416 = -[NSString copyWithZone:](self->_wifiChannelBand, "copyWithZone:", a3);
  v417 = *(void **)(v6 + 1528);
  *(_QWORD *)(v6 + 1528) = v416;

  v418 = -[NSString copyWithZone:](self->_wifiChannelWidth, "copyWithZone:", a3);
  v419 = *(void **)(v6 + 1536);
  *(_QWORD *)(v6 + 1536) = v418;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *awdlElectionParameters;
  NSString *awdlMasterChannel;
  NSString *awdlOpMode;
  int v9;
  NSString *awdlSchedule;
  NSString *awdlSecondaryMasterChannel;
  NSString *awdlSyncChannelSequence;
  NSString *awdlSyncState;
  NSString *btConnectedDevicesCount;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has;
  int v16;
  NSString *callingClient;
  NSString *cellularActiveContexts;
  int v19;
  NSString *cellularAttached;
  NSString *cellularBandinfo;
  NSString *cellularBandwidth;
  NSString *cellularCarrierName;
  NSString *cellularDataBearerSoMask;
  NSString *cellularDataBearerTechnology;
  NSString *cellularDataPlanSignalingReductionOverride;
  NSString *cellularDataPossible;
  NSString *cellularInHomeCountry;
  NSString *cellularIndicator;
  NSString *cellularIndicatorOverride;
  NSString *cellularIsoCountryCode;
  NSString *cellularLqm;
  NSString *cellularLteMaxScheduledLayers;
  NSString *cellularMobileCountryCode;
  NSString *cellularMobileNetworkCode;
  NSString *cellularNewRadioCoverage;
  NSString *cellularNewRadioDataBearer;
  NSString *cellularNewRadioMmwaveDataBearer;
  NSString *cellularNewRadioNsaCoverage;
  NSString *cellularNewRadioNsaDataBearer;
  NSString *cellularNewRadioSaCoverage;
  NSString *cellularNewRadioSaDataBearer;
  NSString *cellularNewRadioSub6DataBearer;
  NSString *cellularNrConfiguredBw;
  NSString *cellularNrLayers;
  NSString *cellularNrModulation;
  NSString *cellularNrRsrp;
  NSString *cellularNrRsrq;
  NSString *cellularNrSnr;
  NSString *cellularPid;
  NSString *cellularRadioAccessTechnology;
  NSString *cellularRadioAccessTechnologyCtDataStatus;
  NSString *cellularRoamAllowed;
  NSString *cellularRsrp;
  NSString *cellularSnr;
  NSString *cellularTac;
  NSString *cellularTotalActiveContexts;
  NSString *cellularTotalBw;
  NSString *cellularTotalCcs;
  NSString *cellularTotalLayers;
  NSString *cellularUarfcn;
  NSString *downloadCdnPop;
  NSString *downloadCdnUuid;
  NSString *downloadConnectionTime;
  NSString *downloadDomainLookupTime;
  NSString *downloadEndDataBearerTechnology;
  NSString *downloadEndPrimaryIpv4Interface;
  NSString *downloadEndRat;
  NSString *downloadFileSize;
  NSString *downloadInterfaceName;
  NSString *downloadInterfaceServiceName;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v72;
  int v73;
  NSString *downloadMaxSpeedObserved;
  NSString *downloadNumberOfStreams;
  NSString *downloadProtocolName;
  NSString *downloadRemoteAddress;
  NSString *downloadRemotePort;
  NSString *downloadRequestTime;
  NSString *downloadRequestToResponseTime;
  NSString *downloadResponseTime;
  NSString *downloadSecureConnectionTime;
  NSString *downloadServer;
  NSString *downloadSpeed;
  NSString *downloadStableSpeed;
  NSString *downloadStartDataBearerTechnology;
  NSString *downloadStartPrimaryIpv4Interface;
  NSString *downloadStartRat;
  int v89;
  NSString *networkPrimaryIpv4InterfaceName;
  NSString *networkPrimaryIpv4ServiceName;
  NSString *nptkitFrameworkVersion;
  NSString *performanceTestStartTime;
  NSString *pingAddress;
  NSString *pingLossPercent;
  NSString *pingMaxLatency;
  NSString *pingMeanLatency;
  NSString *pingMinLatency;
  NSString *pingStandardDeviation;
  NSString *powerBatteryWarningLevel;
  NSString *powerSourceType;
  NSString *powerStateCaps;
  NSString *systemActiveProcessorCount;
  NSString *systemBatteryLevel;
  NSString *systemBatteryState;
  NSString *systemDeviceClass;
  NSString *systemDeviceModel;
  int v108;
  NSString *systemName;
  NSString *systemOsVariant;
  NSString *systemPhysicalMemory;
  int v112;
  NSString *systemProcessorCount;
  NSString *systemVersion;
  NSString *uploadCdnPop;
  NSString *uploadCdnUuid;
  NSString *uploadConnectionTime;
  NSString *uploadDomainLookupTime;
  NSString *uploadEndDataBearerTechnology;
  NSString *uploadEndPrimaryIpv4Interface;
  NSString *uploadEndRat;
  NSString *uploadFileSize;
  NSString *uploadInterfaceName;
  NSString *uploadInterfaceServiceName;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v125;
  int v126;
  NSString *uploadMaxSpeedObserved;
  NSString *uploadNumberOfStreams;
  NSString *uploadProtocolName;
  NSString *uploadRemoteAddress;
  NSString *uploadRemotePort;
  NSString *uploadRequestTime;
  NSString *uploadRequestToResponseTime;
  NSString *uploadResponseTime;
  NSString *uploadSecureConnectionTime;
  NSString *uploadServer;
  NSString *uploadSpeed;
  NSString *uploadStableSpeed;
  NSString *uploadStartDataBearerTechnology;
  NSString *uploadStartPrimaryIpv4Interface;
  NSString *uploadStartRat;
  int v142;
  NSString *wifiAveragePhyRateRx;
  NSString *wifiAverageRssi;
  NSString *wifiAverageSnr;
  NSString *wifiAverageTcpRtt;
  NSString *wifiBtcMode;
  NSString *wifiCca;
  NSString *wifiChannel;
  NSString *wifiCwfCca;
  NSString *wifiEapolControlMode;
  NSString *wifiEapolSupplicantState;
  NSString *wifiGuardInterval;
  NSString *wifiHiddenState;
  int v155;
  NSString *wifiMcsIndex;
  NSString *wifiNoise;
  NSString *wifiNumberOfSpatialStreams;
  NSString *wifiOpMode;
  NSString *wifiPhyMode;
  NSString *wifiRssi;
  NSString *wifiSecurity;
  NSString *wifiTxRate;
  NSString *wrmChannelType;
  NSString *cellularCellid;
  int v166;
  NSString *networkQualityResponsiveness;
  NSString *cellularAggregatedDLBW;
  NSString *cellularAggregatedULBW;
  NSString *cellularIssa;
  NSString *cellularLac;
  NSString *cellularLteNrConfiguredBw;
  NSString *cellularMaxDlMod;
  NSString *cellularMaxNwMimoLyr;
  NSString *cellularMaxSchdMimoLyr;
  NSString *cellularMaxUeRank;
  NSString *cellularMaxUlMod;
  NSString *cellularNrSinr;
  NSString *cellularNrarfcn;
  NSString *cellularRadioFrequency;
  NSString *cellularTotalDlMimoLayers;
  NSString *cellularTotalNumCcs;
  NSString *downloadStartRadioFrequency;
  NSString *downloadEndRadioFrequency;
  NSString *networkPrimaryIpv6InterfaceName;
  NSString *networkPrimaryIpv6ServiceName;
  NSString *uploadStartRadioFrequency;
  NSString *uploadEndRadioFrequency;
  NSString *downloadError;
  NSString *networkQualityError;
  NSString *networkQualityDownloadSpeed;
  NSString *networkQualityUploadSpeed;
  NSString *networkQualityRating;
  NSString *vpnConnectionState;
  NSString *uploadError;
  NSString *uploadErrorDomain;
  NSString *uploadErrorCode;
  NSString *downloadErrorDomain;
  NSString *downloadErrorCode;
  NSString *pingError;
  NSString *pingErrorDomain;
  NSString *pingErrorCode;
  NSString *networkQualityErrorDomain;
  NSString *networkQualityErrorCode;
  NSString *cellularRnMobileCountryCode;
  NSString *cellularRnMobileNetworkCode;
  int v207;
  NSString *downloadStartCellularEstimate;
  NSString *downloadEndCellularEstimate;
  NSString *downloadMaxCellularEstimate;
  NSString *uploadStartCellularEstimate;
  NSString *uploadEndCellularEstimate;
  NSString *uploadMaxCellularEstimate;
  NSString *downloadResponsiveness;
  NSString *downloadResponsivenessConfidence;
  NSString *downloadResponsivenessRating;
  NSString *downloadSpeedConfidence;
  NSString *downloadSpeedRating;
  NSString *uploadResponsiveness;
  NSString *uploadResponsivenessConfidence;
  NSString *uploadResponsivenessRating;
  NSString *uploadSpeedConfidence;
  NSString *uploadSpeedRating;
  NSString *wifiChannelBand;
  NSString *wifiChannelWidth;
  char v226;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_617;
  v5 = *((_DWORD *)v4 + 421);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_617;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_617;
  }
  awdlElectionParameters = self->_awdlElectionParameters;
  if ((unint64_t)awdlElectionParameters | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](awdlElectionParameters, "isEqual:"))
  {
    goto LABEL_617;
  }
  awdlMasterChannel = self->_awdlMasterChannel;
  if ((unint64_t)awdlMasterChannel | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](awdlMasterChannel, "isEqual:"))
      goto LABEL_617;
  }
  awdlOpMode = self->_awdlOpMode;
  if ((unint64_t)awdlOpMode | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](awdlOpMode, "isEqual:"))
      goto LABEL_617;
  }
  v9 = *((_DWORD *)v4 + 421);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v9 & 4) == 0)
      goto LABEL_617;
    if (self->_awdlPowerState)
    {
      if (!*((_BYTE *)v4 + 1657))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1657))
    {
      goto LABEL_617;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_617;
  }
  awdlSchedule = self->_awdlSchedule;
  if ((unint64_t)awdlSchedule | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](awdlSchedule, "isEqual:"))
  {
    goto LABEL_617;
  }
  awdlSecondaryMasterChannel = self->_awdlSecondaryMasterChannel;
  if ((unint64_t)awdlSecondaryMasterChannel | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](awdlSecondaryMasterChannel, "isEqual:"))
      goto LABEL_617;
  }
  awdlSyncChannelSequence = self->_awdlSyncChannelSequence;
  if ((unint64_t)awdlSyncChannelSequence | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](awdlSyncChannelSequence, "isEqual:"))
      goto LABEL_617;
  }
  awdlSyncState = self->_awdlSyncState;
  if ((unint64_t)awdlSyncState | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](awdlSyncState, "isEqual:"))
      goto LABEL_617;
  }
  btConnectedDevicesCount = self->_btConnectedDevicesCount;
  if ((unint64_t)btConnectedDevicesCount | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](btConnectedDevicesCount, "isEqual:"))
      goto LABEL_617;
  }
  has = self->_has;
  v16 = *((_DWORD *)v4 + 421);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v16 & 8) == 0)
      goto LABEL_617;
    if (self->_btIsConnectable)
    {
      if (!*((_BYTE *)v4 + 1658))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1658))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0)
      goto LABEL_617;
    if (self->_btIsDiscoverable)
    {
      if (!*((_BYTE *)v4 + 1659))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1659))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0)
      goto LABEL_617;
    if (self->_btIsPowerOn)
    {
      if (!*((_BYTE *)v4 + 1660))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1660))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0)
      goto LABEL_617;
    if (self->_btIsScanning)
    {
      if (!*((_BYTE *)v4 + 1661))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1661))
    {
      goto LABEL_617;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_617;
  }
  callingClient = self->_callingClient;
  if ((unint64_t)callingClient | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](callingClient, "isEqual:"))
  {
    goto LABEL_617;
  }
  cellularActiveContexts = self->_cellularActiveContexts;
  if ((unint64_t)cellularActiveContexts | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](cellularActiveContexts, "isEqual:"))
      goto LABEL_617;
  }
  v19 = *((_DWORD *)v4 + 421);
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0)
      goto LABEL_617;
    if (self->_cellularAllowsVoip)
    {
      if (!*((_BYTE *)v4 + 1662))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1662))
    {
      goto LABEL_617;
    }
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_617;
  }
  cellularAttached = self->_cellularAttached;
  if ((unint64_t)cellularAttached | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](cellularAttached, "isEqual:"))
  {
    goto LABEL_617;
  }
  cellularBandinfo = self->_cellularBandinfo;
  if ((unint64_t)cellularBandinfo | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](cellularBandinfo, "isEqual:"))
      goto LABEL_617;
  }
  cellularBandwidth = self->_cellularBandwidth;
  if ((unint64_t)cellularBandwidth | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](cellularBandwidth, "isEqual:"))
      goto LABEL_617;
  }
  cellularCarrierName = self->_cellularCarrierName;
  if ((unint64_t)cellularCarrierName | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](cellularCarrierName, "isEqual:"))
      goto LABEL_617;
  }
  cellularDataBearerSoMask = self->_cellularDataBearerSoMask;
  if ((unint64_t)cellularDataBearerSoMask | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](cellularDataBearerSoMask, "isEqual:"))
      goto LABEL_617;
  }
  cellularDataBearerTechnology = self->_cellularDataBearerTechnology;
  if ((unint64_t)cellularDataBearerTechnology | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](cellularDataBearerTechnology, "isEqual:"))
      goto LABEL_617;
  }
  cellularDataPlanSignalingReductionOverride = self->_cellularDataPlanSignalingReductionOverride;
  if ((unint64_t)cellularDataPlanSignalingReductionOverride | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](cellularDataPlanSignalingReductionOverride, "isEqual:"))
      goto LABEL_617;
  }
  cellularDataPossible = self->_cellularDataPossible;
  if ((unint64_t)cellularDataPossible | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](cellularDataPossible, "isEqual:"))
      goto LABEL_617;
  }
  cellularInHomeCountry = self->_cellularInHomeCountry;
  if ((unint64_t)cellularInHomeCountry | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](cellularInHomeCountry, "isEqual:"))
      goto LABEL_617;
  }
  cellularIndicator = self->_cellularIndicator;
  if ((unint64_t)cellularIndicator | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](cellularIndicator, "isEqual:"))
      goto LABEL_617;
  }
  cellularIndicatorOverride = self->_cellularIndicatorOverride;
  if ((unint64_t)cellularIndicatorOverride | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](cellularIndicatorOverride, "isEqual:"))
      goto LABEL_617;
  }
  cellularIsoCountryCode = self->_cellularIsoCountryCode;
  if ((unint64_t)cellularIsoCountryCode | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](cellularIsoCountryCode, "isEqual:"))
      goto LABEL_617;
  }
  cellularLqm = self->_cellularLqm;
  if ((unint64_t)cellularLqm | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](cellularLqm, "isEqual:"))
      goto LABEL_617;
  }
  cellularLteMaxScheduledLayers = self->_cellularLteMaxScheduledLayers;
  if ((unint64_t)cellularLteMaxScheduledLayers | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](cellularLteMaxScheduledLayers, "isEqual:"))
      goto LABEL_617;
  }
  cellularMobileCountryCode = self->_cellularMobileCountryCode;
  if ((unint64_t)cellularMobileCountryCode | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](cellularMobileCountryCode, "isEqual:"))
      goto LABEL_617;
  }
  cellularMobileNetworkCode = self->_cellularMobileNetworkCode;
  if ((unint64_t)cellularMobileNetworkCode | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](cellularMobileNetworkCode, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioCoverage = self->_cellularNewRadioCoverage;
  if ((unint64_t)cellularNewRadioCoverage | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](cellularNewRadioCoverage, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioDataBearer = self->_cellularNewRadioDataBearer;
  if ((unint64_t)cellularNewRadioDataBearer | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](cellularNewRadioDataBearer, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioMmwaveDataBearer = self->_cellularNewRadioMmwaveDataBearer;
  if ((unint64_t)cellularNewRadioMmwaveDataBearer | *((_QWORD *)v4 + 41))
  {
    if (!-[NSString isEqual:](cellularNewRadioMmwaveDataBearer, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioNsaCoverage = self->_cellularNewRadioNsaCoverage;
  if ((unint64_t)cellularNewRadioNsaCoverage | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](cellularNewRadioNsaCoverage, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioNsaDataBearer = self->_cellularNewRadioNsaDataBearer;
  if ((unint64_t)cellularNewRadioNsaDataBearer | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](cellularNewRadioNsaDataBearer, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioSaCoverage = self->_cellularNewRadioSaCoverage;
  if ((unint64_t)cellularNewRadioSaCoverage | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](cellularNewRadioSaCoverage, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioSaDataBearer = self->_cellularNewRadioSaDataBearer;
  if ((unint64_t)cellularNewRadioSaDataBearer | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](cellularNewRadioSaDataBearer, "isEqual:"))
      goto LABEL_617;
  }
  cellularNewRadioSub6DataBearer = self->_cellularNewRadioSub6DataBearer;
  if ((unint64_t)cellularNewRadioSub6DataBearer | *((_QWORD *)v4 + 46))
  {
    if (!-[NSString isEqual:](cellularNewRadioSub6DataBearer, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrConfiguredBw = self->_cellularNrConfiguredBw;
  if ((unint64_t)cellularNrConfiguredBw | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](cellularNrConfiguredBw, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrLayers = self->_cellularNrLayers;
  if ((unint64_t)cellularNrLayers | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](cellularNrLayers, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrModulation = self->_cellularNrModulation;
  if ((unint64_t)cellularNrModulation | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](cellularNrModulation, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrRsrp = self->_cellularNrRsrp;
  if ((unint64_t)cellularNrRsrp | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](cellularNrRsrp, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrRsrq = self->_cellularNrRsrq;
  if ((unint64_t)cellularNrRsrq | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](cellularNrRsrq, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrSnr = self->_cellularNrSnr;
  if ((unint64_t)cellularNrSnr | *((_QWORD *)v4 + 53))
  {
    if (!-[NSString isEqual:](cellularNrSnr, "isEqual:"))
      goto LABEL_617;
  }
  cellularPid = self->_cellularPid;
  if ((unint64_t)cellularPid | *((_QWORD *)v4 + 55))
  {
    if (!-[NSString isEqual:](cellularPid, "isEqual:"))
      goto LABEL_617;
  }
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if ((unint64_t)cellularRadioAccessTechnology | *((_QWORD *)v4 + 56))
  {
    if (!-[NSString isEqual:](cellularRadioAccessTechnology, "isEqual:"))
      goto LABEL_617;
  }
  cellularRadioAccessTechnologyCtDataStatus = self->_cellularRadioAccessTechnologyCtDataStatus;
  if ((unint64_t)cellularRadioAccessTechnologyCtDataStatus | *((_QWORD *)v4 + 57))
  {
    if (!-[NSString isEqual:](cellularRadioAccessTechnologyCtDataStatus, "isEqual:"))
      goto LABEL_617;
  }
  cellularRoamAllowed = self->_cellularRoamAllowed;
  if ((unint64_t)cellularRoamAllowed | *((_QWORD *)v4 + 61))
  {
    if (!-[NSString isEqual:](cellularRoamAllowed, "isEqual:"))
      goto LABEL_617;
  }
  cellularRsrp = self->_cellularRsrp;
  if ((unint64_t)cellularRsrp | *((_QWORD *)v4 + 62))
  {
    if (!-[NSString isEqual:](cellularRsrp, "isEqual:"))
      goto LABEL_617;
  }
  cellularSnr = self->_cellularSnr;
  if ((unint64_t)cellularSnr | *((_QWORD *)v4 + 63))
  {
    if (!-[NSString isEqual:](cellularSnr, "isEqual:"))
      goto LABEL_617;
  }
  cellularTac = self->_cellularTac;
  if ((unint64_t)cellularTac | *((_QWORD *)v4 + 64))
  {
    if (!-[NSString isEqual:](cellularTac, "isEqual:"))
      goto LABEL_617;
  }
  cellularTotalActiveContexts = self->_cellularTotalActiveContexts;
  if ((unint64_t)cellularTotalActiveContexts | *((_QWORD *)v4 + 65))
  {
    if (!-[NSString isEqual:](cellularTotalActiveContexts, "isEqual:"))
      goto LABEL_617;
  }
  cellularTotalBw = self->_cellularTotalBw;
  if ((unint64_t)cellularTotalBw | *((_QWORD *)v4 + 66))
  {
    if (!-[NSString isEqual:](cellularTotalBw, "isEqual:"))
      goto LABEL_617;
  }
  cellularTotalCcs = self->_cellularTotalCcs;
  if ((unint64_t)cellularTotalCcs | *((_QWORD *)v4 + 67))
  {
    if (!-[NSString isEqual:](cellularTotalCcs, "isEqual:"))
      goto LABEL_617;
  }
  cellularTotalLayers = self->_cellularTotalLayers;
  if ((unint64_t)cellularTotalLayers | *((_QWORD *)v4 + 69))
  {
    if (!-[NSString isEqual:](cellularTotalLayers, "isEqual:"))
      goto LABEL_617;
  }
  cellularUarfcn = self->_cellularUarfcn;
  if ((unint64_t)cellularUarfcn | *((_QWORD *)v4 + 71))
  {
    if (!-[NSString isEqual:](cellularUarfcn, "isEqual:"))
      goto LABEL_617;
  }
  downloadCdnPop = self->_downloadCdnPop;
  if ((unint64_t)downloadCdnPop | *((_QWORD *)v4 + 72))
  {
    if (!-[NSString isEqual:](downloadCdnPop, "isEqual:"))
      goto LABEL_617;
  }
  downloadCdnUuid = self->_downloadCdnUuid;
  if ((unint64_t)downloadCdnUuid | *((_QWORD *)v4 + 73))
  {
    if (!-[NSString isEqual:](downloadCdnUuid, "isEqual:"))
      goto LABEL_617;
  }
  downloadConnectionTime = self->_downloadConnectionTime;
  if ((unint64_t)downloadConnectionTime | *((_QWORD *)v4 + 74))
  {
    if (!-[NSString isEqual:](downloadConnectionTime, "isEqual:"))
      goto LABEL_617;
  }
  downloadDomainLookupTime = self->_downloadDomainLookupTime;
  if ((unint64_t)downloadDomainLookupTime | *((_QWORD *)v4 + 75))
  {
    if (!-[NSString isEqual:](downloadDomainLookupTime, "isEqual:"))
      goto LABEL_617;
  }
  downloadEndDataBearerTechnology = self->_downloadEndDataBearerTechnology;
  if ((unint64_t)downloadEndDataBearerTechnology | *((_QWORD *)v4 + 77))
  {
    if (!-[NSString isEqual:](downloadEndDataBearerTechnology, "isEqual:"))
      goto LABEL_617;
  }
  downloadEndPrimaryIpv4Interface = self->_downloadEndPrimaryIpv4Interface;
  if ((unint64_t)downloadEndPrimaryIpv4Interface | *((_QWORD *)v4 + 78))
  {
    if (!-[NSString isEqual:](downloadEndPrimaryIpv4Interface, "isEqual:"))
      goto LABEL_617;
  }
  downloadEndRat = self->_downloadEndRat;
  if ((unint64_t)downloadEndRat | *((_QWORD *)v4 + 80))
  {
    if (!-[NSString isEqual:](downloadEndRat, "isEqual:"))
      goto LABEL_617;
  }
  downloadFileSize = self->_downloadFileSize;
  if ((unint64_t)downloadFileSize | *((_QWORD *)v4 + 84))
  {
    if (!-[NSString isEqual:](downloadFileSize, "isEqual:"))
      goto LABEL_617;
  }
  downloadInterfaceName = self->_downloadInterfaceName;
  if ((unint64_t)downloadInterfaceName | *((_QWORD *)v4 + 85))
  {
    if (!-[NSString isEqual:](downloadInterfaceName, "isEqual:"))
      goto LABEL_617;
  }
  downloadInterfaceServiceName = self->_downloadInterfaceServiceName;
  if ((unint64_t)downloadInterfaceServiceName | *((_QWORD *)v4 + 86))
  {
    if (!-[NSString isEqual:](downloadInterfaceServiceName, "isEqual:"))
      goto LABEL_617;
  }
  v72 = self->_has;
  v73 = *((_DWORD *)v4 + 421);
  if ((*(_WORD *)&v72 & 0x200) != 0)
  {
    if ((v73 & 0x200) == 0)
      goto LABEL_617;
    if (self->_downloadIsCellular)
    {
      if (!*((_BYTE *)v4 + 1664))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1664))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x200) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x400) != 0)
  {
    if ((v73 & 0x400) == 0)
      goto LABEL_617;
    if (self->_downloadIsConstrained)
    {
      if (!*((_BYTE *)v4 + 1665))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1665))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x400) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x800) != 0)
  {
    if ((v73 & 0x800) == 0)
      goto LABEL_617;
    if (self->_downloadIsExpensive)
    {
      if (!*((_BYTE *)v4 + 1666))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1666))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x800) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x1000) != 0)
  {
    if ((v73 & 0x1000) == 0)
      goto LABEL_617;
    if (self->_downloadIsMultipath)
    {
      if (!*((_BYTE *)v4 + 1667))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1667))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x1000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x2000) != 0)
  {
    if ((v73 & 0x2000) == 0)
      goto LABEL_617;
    if (self->_downloadIsProxyConnection)
    {
      if (!*((_BYTE *)v4 + 1668))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1668))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x2000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_WORD *)&v72 & 0x4000) != 0)
  {
    if ((v73 & 0x4000) == 0)
      goto LABEL_617;
    if (self->_downloadIsReusedConnection)
    {
      if (!*((_BYTE *)v4 + 1669))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1669))
    {
      goto LABEL_617;
    }
  }
  else if ((v73 & 0x4000) != 0)
  {
    goto LABEL_617;
  }
  downloadMaxSpeedObserved = self->_downloadMaxSpeedObserved;
  if ((unint64_t)downloadMaxSpeedObserved | *((_QWORD *)v4 + 88)
    && !-[NSString isEqual:](downloadMaxSpeedObserved, "isEqual:"))
  {
    goto LABEL_617;
  }
  downloadNumberOfStreams = self->_downloadNumberOfStreams;
  if ((unint64_t)downloadNumberOfStreams | *((_QWORD *)v4 + 89))
  {
    if (!-[NSString isEqual:](downloadNumberOfStreams, "isEqual:"))
      goto LABEL_617;
  }
  downloadProtocolName = self->_downloadProtocolName;
  if ((unint64_t)downloadProtocolName | *((_QWORD *)v4 + 90))
  {
    if (!-[NSString isEqual:](downloadProtocolName, "isEqual:"))
      goto LABEL_617;
  }
  downloadRemoteAddress = self->_downloadRemoteAddress;
  if ((unint64_t)downloadRemoteAddress | *((_QWORD *)v4 + 91))
  {
    if (!-[NSString isEqual:](downloadRemoteAddress, "isEqual:"))
      goto LABEL_617;
  }
  downloadRemotePort = self->_downloadRemotePort;
  if ((unint64_t)downloadRemotePort | *((_QWORD *)v4 + 92))
  {
    if (!-[NSString isEqual:](downloadRemotePort, "isEqual:"))
      goto LABEL_617;
  }
  downloadRequestTime = self->_downloadRequestTime;
  if ((unint64_t)downloadRequestTime | *((_QWORD *)v4 + 93))
  {
    if (!-[NSString isEqual:](downloadRequestTime, "isEqual:"))
      goto LABEL_617;
  }
  downloadRequestToResponseTime = self->_downloadRequestToResponseTime;
  if ((unint64_t)downloadRequestToResponseTime | *((_QWORD *)v4 + 94))
  {
    if (!-[NSString isEqual:](downloadRequestToResponseTime, "isEqual:"))
      goto LABEL_617;
  }
  downloadResponseTime = self->_downloadResponseTime;
  if ((unint64_t)downloadResponseTime | *((_QWORD *)v4 + 95))
  {
    if (!-[NSString isEqual:](downloadResponseTime, "isEqual:"))
      goto LABEL_617;
  }
  downloadSecureConnectionTime = self->_downloadSecureConnectionTime;
  if ((unint64_t)downloadSecureConnectionTime | *((_QWORD *)v4 + 99))
  {
    if (!-[NSString isEqual:](downloadSecureConnectionTime, "isEqual:"))
      goto LABEL_617;
  }
  downloadServer = self->_downloadServer;
  if ((unint64_t)downloadServer | *((_QWORD *)v4 + 100))
  {
    if (!-[NSString isEqual:](downloadServer, "isEqual:"))
      goto LABEL_617;
  }
  downloadSpeed = self->_downloadSpeed;
  if ((unint64_t)downloadSpeed | *((_QWORD *)v4 + 101))
  {
    if (!-[NSString isEqual:](downloadSpeed, "isEqual:"))
      goto LABEL_617;
  }
  downloadStableSpeed = self->_downloadStableSpeed;
  if ((unint64_t)downloadStableSpeed | *((_QWORD *)v4 + 104))
  {
    if (!-[NSString isEqual:](downloadStableSpeed, "isEqual:"))
      goto LABEL_617;
  }
  downloadStartDataBearerTechnology = self->_downloadStartDataBearerTechnology;
  if ((unint64_t)downloadStartDataBearerTechnology | *((_QWORD *)v4 + 106))
  {
    if (!-[NSString isEqual:](downloadStartDataBearerTechnology, "isEqual:"))
      goto LABEL_617;
  }
  downloadStartPrimaryIpv4Interface = self->_downloadStartPrimaryIpv4Interface;
  if ((unint64_t)downloadStartPrimaryIpv4Interface | *((_QWORD *)v4 + 107))
  {
    if (!-[NSString isEqual:](downloadStartPrimaryIpv4Interface, "isEqual:"))
      goto LABEL_617;
  }
  downloadStartRat = self->_downloadStartRat;
  if ((unint64_t)downloadStartRat | *((_QWORD *)v4 + 109))
  {
    if (!-[NSString isEqual:](downloadStartRat, "isEqual:"))
      goto LABEL_617;
  }
  v89 = *((_DWORD *)v4 + 421);
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    if ((v89 & 0x8000) == 0)
      goto LABEL_617;
    if (self->_networkIsAppleReachable)
    {
      if (!*((_BYTE *)v4 + 1670))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1670))
    {
      goto LABEL_617;
    }
  }
  else if ((v89 & 0x8000) != 0)
  {
    goto LABEL_617;
  }
  networkPrimaryIpv4InterfaceName = self->_networkPrimaryIpv4InterfaceName;
  if ((unint64_t)networkPrimaryIpv4InterfaceName | *((_QWORD *)v4 + 110)
    && !-[NSString isEqual:](networkPrimaryIpv4InterfaceName, "isEqual:"))
  {
    goto LABEL_617;
  }
  networkPrimaryIpv4ServiceName = self->_networkPrimaryIpv4ServiceName;
  if ((unint64_t)networkPrimaryIpv4ServiceName | *((_QWORD *)v4 + 111))
  {
    if (!-[NSString isEqual:](networkPrimaryIpv4ServiceName, "isEqual:"))
      goto LABEL_617;
  }
  nptkitFrameworkVersion = self->_nptkitFrameworkVersion;
  if ((unint64_t)nptkitFrameworkVersion | *((_QWORD *)v4 + 121))
  {
    if (!-[NSString isEqual:](nptkitFrameworkVersion, "isEqual:"))
      goto LABEL_617;
  }
  performanceTestStartTime = self->_performanceTestStartTime;
  if ((unint64_t)performanceTestStartTime | *((_QWORD *)v4 + 122))
  {
    if (!-[NSString isEqual:](performanceTestStartTime, "isEqual:"))
      goto LABEL_617;
  }
  pingAddress = self->_pingAddress;
  if ((unint64_t)pingAddress | *((_QWORD *)v4 + 123))
  {
    if (!-[NSString isEqual:](pingAddress, "isEqual:"))
      goto LABEL_617;
  }
  pingLossPercent = self->_pingLossPercent;
  if ((unint64_t)pingLossPercent | *((_QWORD *)v4 + 127))
  {
    if (!-[NSString isEqual:](pingLossPercent, "isEqual:"))
      goto LABEL_617;
  }
  pingMaxLatency = self->_pingMaxLatency;
  if ((unint64_t)pingMaxLatency | *((_QWORD *)v4 + 128))
  {
    if (!-[NSString isEqual:](pingMaxLatency, "isEqual:"))
      goto LABEL_617;
  }
  pingMeanLatency = self->_pingMeanLatency;
  if ((unint64_t)pingMeanLatency | *((_QWORD *)v4 + 129))
  {
    if (!-[NSString isEqual:](pingMeanLatency, "isEqual:"))
      goto LABEL_617;
  }
  pingMinLatency = self->_pingMinLatency;
  if ((unint64_t)pingMinLatency | *((_QWORD *)v4 + 130))
  {
    if (!-[NSString isEqual:](pingMinLatency, "isEqual:"))
      goto LABEL_617;
  }
  pingStandardDeviation = self->_pingStandardDeviation;
  if ((unint64_t)pingStandardDeviation | *((_QWORD *)v4 + 131))
  {
    if (!-[NSString isEqual:](pingStandardDeviation, "isEqual:"))
      goto LABEL_617;
  }
  powerBatteryWarningLevel = self->_powerBatteryWarningLevel;
  if ((unint64_t)powerBatteryWarningLevel | *((_QWORD *)v4 + 132))
  {
    if (!-[NSString isEqual:](powerBatteryWarningLevel, "isEqual:"))
      goto LABEL_617;
  }
  powerSourceType = self->_powerSourceType;
  if ((unint64_t)powerSourceType | *((_QWORD *)v4 + 133))
  {
    if (!-[NSString isEqual:](powerSourceType, "isEqual:"))
      goto LABEL_617;
  }
  powerStateCaps = self->_powerStateCaps;
  if ((unint64_t)powerStateCaps | *((_QWORD *)v4 + 134))
  {
    if (!-[NSString isEqual:](powerStateCaps, "isEqual:"))
      goto LABEL_617;
  }
  systemActiveProcessorCount = self->_systemActiveProcessorCount;
  if ((unint64_t)systemActiveProcessorCount | *((_QWORD *)v4 + 135))
  {
    if (!-[NSString isEqual:](systemActiveProcessorCount, "isEqual:"))
      goto LABEL_617;
  }
  systemBatteryLevel = self->_systemBatteryLevel;
  if ((unint64_t)systemBatteryLevel | *((_QWORD *)v4 + 136))
  {
    if (!-[NSString isEqual:](systemBatteryLevel, "isEqual:"))
      goto LABEL_617;
  }
  systemBatteryState = self->_systemBatteryState;
  if ((unint64_t)systemBatteryState | *((_QWORD *)v4 + 137))
  {
    if (!-[NSString isEqual:](systemBatteryState, "isEqual:"))
      goto LABEL_617;
  }
  systemDeviceClass = self->_systemDeviceClass;
  if ((unint64_t)systemDeviceClass | *((_QWORD *)v4 + 138))
  {
    if (!-[NSString isEqual:](systemDeviceClass, "isEqual:"))
      goto LABEL_617;
  }
  systemDeviceModel = self->_systemDeviceModel;
  if ((unint64_t)systemDeviceModel | *((_QWORD *)v4 + 139))
  {
    if (!-[NSString isEqual:](systemDeviceModel, "isEqual:"))
      goto LABEL_617;
  }
  v108 = *((_DWORD *)v4 + 421);
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    if ((v108 & 0x10000) == 0)
      goto LABEL_617;
    if (self->_systemLowPowerModeEnabled)
    {
      if (!*((_BYTE *)v4 + 1671))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1671))
    {
      goto LABEL_617;
    }
  }
  else if ((v108 & 0x10000) != 0)
  {
    goto LABEL_617;
  }
  systemName = self->_systemName;
  if ((unint64_t)systemName | *((_QWORD *)v4 + 140)
    && !-[NSString isEqual:](systemName, "isEqual:"))
  {
    goto LABEL_617;
  }
  systemOsVariant = self->_systemOsVariant;
  if ((unint64_t)systemOsVariant | *((_QWORD *)v4 + 141))
  {
    if (!-[NSString isEqual:](systemOsVariant, "isEqual:"))
      goto LABEL_617;
  }
  systemPhysicalMemory = self->_systemPhysicalMemory;
  if ((unint64_t)systemPhysicalMemory | *((_QWORD *)v4 + 142))
  {
    if (!-[NSString isEqual:](systemPhysicalMemory, "isEqual:"))
      goto LABEL_617;
  }
  v112 = *((_DWORD *)v4 + 421);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    if ((v112 & 0x20000) == 0)
      goto LABEL_617;
    if (self->_systemPowersourceConnected)
    {
      if (!*((_BYTE *)v4 + 1672))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1672))
    {
      goto LABEL_617;
    }
  }
  else if ((v112 & 0x20000) != 0)
  {
    goto LABEL_617;
  }
  systemProcessorCount = self->_systemProcessorCount;
  if ((unint64_t)systemProcessorCount | *((_QWORD *)v4 + 143)
    && !-[NSString isEqual:](systemProcessorCount, "isEqual:"))
  {
    goto LABEL_617;
  }
  systemVersion = self->_systemVersion;
  if ((unint64_t)systemVersion | *((_QWORD *)v4 + 144))
  {
    if (!-[NSString isEqual:](systemVersion, "isEqual:"))
      goto LABEL_617;
  }
  uploadCdnPop = self->_uploadCdnPop;
  if ((unint64_t)uploadCdnPop | *((_QWORD *)v4 + 145))
  {
    if (!-[NSString isEqual:](uploadCdnPop, "isEqual:"))
      goto LABEL_617;
  }
  uploadCdnUuid = self->_uploadCdnUuid;
  if ((unint64_t)uploadCdnUuid | *((_QWORD *)v4 + 146))
  {
    if (!-[NSString isEqual:](uploadCdnUuid, "isEqual:"))
      goto LABEL_617;
  }
  uploadConnectionTime = self->_uploadConnectionTime;
  if ((unint64_t)uploadConnectionTime | *((_QWORD *)v4 + 147))
  {
    if (!-[NSString isEqual:](uploadConnectionTime, "isEqual:"))
      goto LABEL_617;
  }
  uploadDomainLookupTime = self->_uploadDomainLookupTime;
  if ((unint64_t)uploadDomainLookupTime | *((_QWORD *)v4 + 148))
  {
    if (!-[NSString isEqual:](uploadDomainLookupTime, "isEqual:"))
      goto LABEL_617;
  }
  uploadEndDataBearerTechnology = self->_uploadEndDataBearerTechnology;
  if ((unint64_t)uploadEndDataBearerTechnology | *((_QWORD *)v4 + 150))
  {
    if (!-[NSString isEqual:](uploadEndDataBearerTechnology, "isEqual:"))
      goto LABEL_617;
  }
  uploadEndPrimaryIpv4Interface = self->_uploadEndPrimaryIpv4Interface;
  if ((unint64_t)uploadEndPrimaryIpv4Interface | *((_QWORD *)v4 + 151))
  {
    if (!-[NSString isEqual:](uploadEndPrimaryIpv4Interface, "isEqual:"))
      goto LABEL_617;
  }
  uploadEndRat = self->_uploadEndRat;
  if ((unint64_t)uploadEndRat | *((_QWORD *)v4 + 153))
  {
    if (!-[NSString isEqual:](uploadEndRat, "isEqual:"))
      goto LABEL_617;
  }
  uploadFileSize = self->_uploadFileSize;
  if ((unint64_t)uploadFileSize | *((_QWORD *)v4 + 157))
  {
    if (!-[NSString isEqual:](uploadFileSize, "isEqual:"))
      goto LABEL_617;
  }
  uploadInterfaceName = self->_uploadInterfaceName;
  if ((unint64_t)uploadInterfaceName | *((_QWORD *)v4 + 158))
  {
    if (!-[NSString isEqual:](uploadInterfaceName, "isEqual:"))
      goto LABEL_617;
  }
  uploadInterfaceServiceName = self->_uploadInterfaceServiceName;
  if ((unint64_t)uploadInterfaceServiceName | *((_QWORD *)v4 + 159))
  {
    if (!-[NSString isEqual:](uploadInterfaceServiceName, "isEqual:"))
      goto LABEL_617;
  }
  v125 = self->_has;
  v126 = *((_DWORD *)v4 + 421);
  if ((*(_DWORD *)&v125 & 0x40000) != 0)
  {
    if ((v126 & 0x40000) == 0)
      goto LABEL_617;
    if (self->_uploadIsCellular)
    {
      if (!*((_BYTE *)v4 + 1673))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1673))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x40000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x80000) != 0)
  {
    if ((v126 & 0x80000) == 0)
      goto LABEL_617;
    if (self->_uploadIsConstrained)
    {
      if (!*((_BYTE *)v4 + 1674))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1674))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x80000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x100000) != 0)
  {
    if ((v126 & 0x100000) == 0)
      goto LABEL_617;
    if (self->_uploadIsExpensive)
    {
      if (!*((_BYTE *)v4 + 1675))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1675))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x100000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x200000) != 0)
  {
    if ((v126 & 0x200000) == 0)
      goto LABEL_617;
    if (self->_uploadIsMultipath)
    {
      if (!*((_BYTE *)v4 + 1676))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1676))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x200000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x400000) != 0)
  {
    if ((v126 & 0x400000) == 0)
      goto LABEL_617;
    if (self->_uploadIsProxyConnection)
    {
      if (!*((_BYTE *)v4 + 1677))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1677))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x400000) != 0)
  {
    goto LABEL_617;
  }
  if ((*(_DWORD *)&v125 & 0x800000) != 0)
  {
    if ((v126 & 0x800000) == 0)
      goto LABEL_617;
    if (self->_uploadIsReusedConnection)
    {
      if (!*((_BYTE *)v4 + 1678))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1678))
    {
      goto LABEL_617;
    }
  }
  else if ((v126 & 0x800000) != 0)
  {
    goto LABEL_617;
  }
  uploadMaxSpeedObserved = self->_uploadMaxSpeedObserved;
  if ((unint64_t)uploadMaxSpeedObserved | *((_QWORD *)v4 + 161)
    && !-[NSString isEqual:](uploadMaxSpeedObserved, "isEqual:"))
  {
    goto LABEL_617;
  }
  uploadNumberOfStreams = self->_uploadNumberOfStreams;
  if ((unint64_t)uploadNumberOfStreams | *((_QWORD *)v4 + 162))
  {
    if (!-[NSString isEqual:](uploadNumberOfStreams, "isEqual:"))
      goto LABEL_617;
  }
  uploadProtocolName = self->_uploadProtocolName;
  if ((unint64_t)uploadProtocolName | *((_QWORD *)v4 + 163))
  {
    if (!-[NSString isEqual:](uploadProtocolName, "isEqual:"))
      goto LABEL_617;
  }
  uploadRemoteAddress = self->_uploadRemoteAddress;
  if ((unint64_t)uploadRemoteAddress | *((_QWORD *)v4 + 164))
  {
    if (!-[NSString isEqual:](uploadRemoteAddress, "isEqual:"))
      goto LABEL_617;
  }
  uploadRemotePort = self->_uploadRemotePort;
  if ((unint64_t)uploadRemotePort | *((_QWORD *)v4 + 165))
  {
    if (!-[NSString isEqual:](uploadRemotePort, "isEqual:"))
      goto LABEL_617;
  }
  uploadRequestTime = self->_uploadRequestTime;
  if ((unint64_t)uploadRequestTime | *((_QWORD *)v4 + 166))
  {
    if (!-[NSString isEqual:](uploadRequestTime, "isEqual:"))
      goto LABEL_617;
  }
  uploadRequestToResponseTime = self->_uploadRequestToResponseTime;
  if ((unint64_t)uploadRequestToResponseTime | *((_QWORD *)v4 + 167))
  {
    if (!-[NSString isEqual:](uploadRequestToResponseTime, "isEqual:"))
      goto LABEL_617;
  }
  uploadResponseTime = self->_uploadResponseTime;
  if ((unint64_t)uploadResponseTime | *((_QWORD *)v4 + 168))
  {
    if (!-[NSString isEqual:](uploadResponseTime, "isEqual:"))
      goto LABEL_617;
  }
  uploadSecureConnectionTime = self->_uploadSecureConnectionTime;
  if ((unint64_t)uploadSecureConnectionTime | *((_QWORD *)v4 + 172))
  {
    if (!-[NSString isEqual:](uploadSecureConnectionTime, "isEqual:"))
      goto LABEL_617;
  }
  uploadServer = self->_uploadServer;
  if ((unint64_t)uploadServer | *((_QWORD *)v4 + 173))
  {
    if (!-[NSString isEqual:](uploadServer, "isEqual:"))
      goto LABEL_617;
  }
  uploadSpeed = self->_uploadSpeed;
  if ((unint64_t)uploadSpeed | *((_QWORD *)v4 + 174))
  {
    if (!-[NSString isEqual:](uploadSpeed, "isEqual:"))
      goto LABEL_617;
  }
  uploadStableSpeed = self->_uploadStableSpeed;
  if ((unint64_t)uploadStableSpeed | *((_QWORD *)v4 + 177))
  {
    if (!-[NSString isEqual:](uploadStableSpeed, "isEqual:"))
      goto LABEL_617;
  }
  uploadStartDataBearerTechnology = self->_uploadStartDataBearerTechnology;
  if ((unint64_t)uploadStartDataBearerTechnology | *((_QWORD *)v4 + 179))
  {
    if (!-[NSString isEqual:](uploadStartDataBearerTechnology, "isEqual:"))
      goto LABEL_617;
  }
  uploadStartPrimaryIpv4Interface = self->_uploadStartPrimaryIpv4Interface;
  if ((unint64_t)uploadStartPrimaryIpv4Interface | *((_QWORD *)v4 + 180))
  {
    if (!-[NSString isEqual:](uploadStartPrimaryIpv4Interface, "isEqual:"))
      goto LABEL_617;
  }
  uploadStartRat = self->_uploadStartRat;
  if ((unint64_t)uploadStartRat | *((_QWORD *)v4 + 182))
  {
    if (!-[NSString isEqual:](uploadStartRat, "isEqual:"))
      goto LABEL_617;
  }
  v142 = *((_DWORD *)v4 + 421);
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    if ((v142 & 0x1000000) == 0)
      goto LABEL_617;
    if (self->_useWifiWasSpecified)
    {
      if (!*((_BYTE *)v4 + 1679))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1679))
    {
      goto LABEL_617;
    }
  }
  else if ((v142 & 0x1000000) != 0)
  {
    goto LABEL_617;
  }
  wifiAveragePhyRateRx = self->_wifiAveragePhyRateRx;
  if ((unint64_t)wifiAveragePhyRateRx | *((_QWORD *)v4 + 184)
    && !-[NSString isEqual:](wifiAveragePhyRateRx, "isEqual:"))
  {
    goto LABEL_617;
  }
  wifiAverageRssi = self->_wifiAverageRssi;
  if ((unint64_t)wifiAverageRssi | *((_QWORD *)v4 + 185))
  {
    if (!-[NSString isEqual:](wifiAverageRssi, "isEqual:"))
      goto LABEL_617;
  }
  wifiAverageSnr = self->_wifiAverageSnr;
  if ((unint64_t)wifiAverageSnr | *((_QWORD *)v4 + 186))
  {
    if (!-[NSString isEqual:](wifiAverageSnr, "isEqual:"))
      goto LABEL_617;
  }
  wifiAverageTcpRtt = self->_wifiAverageTcpRtt;
  if ((unint64_t)wifiAverageTcpRtt | *((_QWORD *)v4 + 187))
  {
    if (!-[NSString isEqual:](wifiAverageTcpRtt, "isEqual:"))
      goto LABEL_617;
  }
  wifiBtcMode = self->_wifiBtcMode;
  if ((unint64_t)wifiBtcMode | *((_QWORD *)v4 + 188))
  {
    if (!-[NSString isEqual:](wifiBtcMode, "isEqual:"))
      goto LABEL_617;
  }
  wifiCca = self->_wifiCca;
  if ((unint64_t)wifiCca | *((_QWORD *)v4 + 189))
  {
    if (!-[NSString isEqual:](wifiCca, "isEqual:"))
      goto LABEL_617;
  }
  wifiChannel = self->_wifiChannel;
  if ((unint64_t)wifiChannel | *((_QWORD *)v4 + 190))
  {
    if (!-[NSString isEqual:](wifiChannel, "isEqual:"))
      goto LABEL_617;
  }
  wifiCwfCca = self->_wifiCwfCca;
  if ((unint64_t)wifiCwfCca | *((_QWORD *)v4 + 193))
  {
    if (!-[NSString isEqual:](wifiCwfCca, "isEqual:"))
      goto LABEL_617;
  }
  wifiEapolControlMode = self->_wifiEapolControlMode;
  if ((unint64_t)wifiEapolControlMode | *((_QWORD *)v4 + 194))
  {
    if (!-[NSString isEqual:](wifiEapolControlMode, "isEqual:"))
      goto LABEL_617;
  }
  wifiEapolSupplicantState = self->_wifiEapolSupplicantState;
  if ((unint64_t)wifiEapolSupplicantState | *((_QWORD *)v4 + 195))
  {
    if (!-[NSString isEqual:](wifiEapolSupplicantState, "isEqual:"))
      goto LABEL_617;
  }
  wifiGuardInterval = self->_wifiGuardInterval;
  if ((unint64_t)wifiGuardInterval | *((_QWORD *)v4 + 196))
  {
    if (!-[NSString isEqual:](wifiGuardInterval, "isEqual:"))
      goto LABEL_617;
  }
  wifiHiddenState = self->_wifiHiddenState;
  if ((unint64_t)wifiHiddenState | *((_QWORD *)v4 + 197))
  {
    if (!-[NSString isEqual:](wifiHiddenState, "isEqual:"))
      goto LABEL_617;
  }
  v155 = *((_DWORD *)v4 + 421);
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
  {
    if ((v155 & 0x2000000) == 0)
      goto LABEL_617;
    if (self->_wifiIsCaptive)
    {
      if (!*((_BYTE *)v4 + 1680))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1680))
    {
      goto LABEL_617;
    }
  }
  else if ((v155 & 0x2000000) != 0)
  {
    goto LABEL_617;
  }
  wifiMcsIndex = self->_wifiMcsIndex;
  if ((unint64_t)wifiMcsIndex | *((_QWORD *)v4 + 198)
    && !-[NSString isEqual:](wifiMcsIndex, "isEqual:"))
  {
    goto LABEL_617;
  }
  wifiNoise = self->_wifiNoise;
  if ((unint64_t)wifiNoise | *((_QWORD *)v4 + 199))
  {
    if (!-[NSString isEqual:](wifiNoise, "isEqual:"))
      goto LABEL_617;
  }
  wifiNumberOfSpatialStreams = self->_wifiNumberOfSpatialStreams;
  if ((unint64_t)wifiNumberOfSpatialStreams | *((_QWORD *)v4 + 200))
  {
    if (!-[NSString isEqual:](wifiNumberOfSpatialStreams, "isEqual:"))
      goto LABEL_617;
  }
  wifiOpMode = self->_wifiOpMode;
  if ((unint64_t)wifiOpMode | *((_QWORD *)v4 + 201))
  {
    if (!-[NSString isEqual:](wifiOpMode, "isEqual:"))
      goto LABEL_617;
  }
  wifiPhyMode = self->_wifiPhyMode;
  if ((unint64_t)wifiPhyMode | *((_QWORD *)v4 + 202))
  {
    if (!-[NSString isEqual:](wifiPhyMode, "isEqual:"))
      goto LABEL_617;
  }
  wifiRssi = self->_wifiRssi;
  if ((unint64_t)wifiRssi | *((_QWORD *)v4 + 203))
  {
    if (!-[NSString isEqual:](wifiRssi, "isEqual:"))
      goto LABEL_617;
  }
  wifiSecurity = self->_wifiSecurity;
  if ((unint64_t)wifiSecurity | *((_QWORD *)v4 + 204))
  {
    if (!-[NSString isEqual:](wifiSecurity, "isEqual:"))
      goto LABEL_617;
  }
  wifiTxRate = self->_wifiTxRate;
  if ((unint64_t)wifiTxRate | *((_QWORD *)v4 + 205))
  {
    if (!-[NSString isEqual:](wifiTxRate, "isEqual:"))
      goto LABEL_617;
  }
  wrmChannelType = self->_wrmChannelType;
  if ((unint64_t)wrmChannelType | *((_QWORD *)v4 + 206))
  {
    if (!-[NSString isEqual:](wrmChannelType, "isEqual:"))
      goto LABEL_617;
  }
  cellularCellid = self->_cellularCellid;
  if ((unint64_t)cellularCellid | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](cellularCellid, "isEqual:"))
      goto LABEL_617;
  }
  v166 = *((_DWORD *)v4 + 421);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v166 & 2) == 0)
      goto LABEL_617;
    if (self->_acceptablePerformanceResult)
    {
      if (!*((_BYTE *)v4 + 1656))
        goto LABEL_617;
    }
    else if (*((_BYTE *)v4 + 1656))
    {
      goto LABEL_617;
    }
  }
  else if ((v166 & 2) != 0)
  {
    goto LABEL_617;
  }
  networkQualityResponsiveness = self->_networkQualityResponsiveness;
  if ((unint64_t)networkQualityResponsiveness | *((_QWORD *)v4 + 119)
    && !-[NSString isEqual:](networkQualityResponsiveness, "isEqual:"))
  {
    goto LABEL_617;
  }
  cellularAggregatedDLBW = self->_cellularAggregatedDLBW;
  if ((unint64_t)cellularAggregatedDLBW | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](cellularAggregatedDLBW, "isEqual:"))
      goto LABEL_617;
  }
  cellularAggregatedULBW = self->_cellularAggregatedULBW;
  if ((unint64_t)cellularAggregatedULBW | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](cellularAggregatedULBW, "isEqual:"))
      goto LABEL_617;
  }
  cellularIssa = self->_cellularIssa;
  if ((unint64_t)cellularIssa | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](cellularIssa, "isEqual:"))
      goto LABEL_617;
  }
  cellularLac = self->_cellularLac;
  if ((unint64_t)cellularLac | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](cellularLac, "isEqual:"))
      goto LABEL_617;
  }
  cellularLteNrConfiguredBw = self->_cellularLteNrConfiguredBw;
  if ((unint64_t)cellularLteNrConfiguredBw | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](cellularLteNrConfiguredBw, "isEqual:"))
      goto LABEL_617;
  }
  cellularMaxDlMod = self->_cellularMaxDlMod;
  if ((unint64_t)cellularMaxDlMod | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](cellularMaxDlMod, "isEqual:"))
      goto LABEL_617;
  }
  cellularMaxNwMimoLyr = self->_cellularMaxNwMimoLyr;
  if ((unint64_t)cellularMaxNwMimoLyr | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](cellularMaxNwMimoLyr, "isEqual:"))
      goto LABEL_617;
  }
  cellularMaxSchdMimoLyr = self->_cellularMaxSchdMimoLyr;
  if ((unint64_t)cellularMaxSchdMimoLyr | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](cellularMaxSchdMimoLyr, "isEqual:"))
      goto LABEL_617;
  }
  cellularMaxUeRank = self->_cellularMaxUeRank;
  if ((unint64_t)cellularMaxUeRank | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](cellularMaxUeRank, "isEqual:"))
      goto LABEL_617;
  }
  cellularMaxUlMod = self->_cellularMaxUlMod;
  if ((unint64_t)cellularMaxUlMod | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](cellularMaxUlMod, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrSinr = self->_cellularNrSinr;
  if ((unint64_t)cellularNrSinr | *((_QWORD *)v4 + 52))
  {
    if (!-[NSString isEqual:](cellularNrSinr, "isEqual:"))
      goto LABEL_617;
  }
  cellularNrarfcn = self->_cellularNrarfcn;
  if ((unint64_t)cellularNrarfcn | *((_QWORD *)v4 + 54))
  {
    if (!-[NSString isEqual:](cellularNrarfcn, "isEqual:"))
      goto LABEL_617;
  }
  cellularRadioFrequency = self->_cellularRadioFrequency;
  if ((unint64_t)cellularRadioFrequency | *((_QWORD *)v4 + 58))
  {
    if (!-[NSString isEqual:](cellularRadioFrequency, "isEqual:"))
      goto LABEL_617;
  }
  cellularTotalDlMimoLayers = self->_cellularTotalDlMimoLayers;
  if ((unint64_t)cellularTotalDlMimoLayers | *((_QWORD *)v4 + 68))
  {
    if (!-[NSString isEqual:](cellularTotalDlMimoLayers, "isEqual:"))
      goto LABEL_617;
  }
  cellularTotalNumCcs = self->_cellularTotalNumCcs;
  if ((unint64_t)cellularTotalNumCcs | *((_QWORD *)v4 + 70))
  {
    if (!-[NSString isEqual:](cellularTotalNumCcs, "isEqual:"))
      goto LABEL_617;
  }
  downloadStartRadioFrequency = self->_downloadStartRadioFrequency;
  if ((unint64_t)downloadStartRadioFrequency | *((_QWORD *)v4 + 108))
  {
    if (!-[NSString isEqual:](downloadStartRadioFrequency, "isEqual:"))
      goto LABEL_617;
  }
  downloadEndRadioFrequency = self->_downloadEndRadioFrequency;
  if ((unint64_t)downloadEndRadioFrequency | *((_QWORD *)v4 + 79))
  {
    if (!-[NSString isEqual:](downloadEndRadioFrequency, "isEqual:"))
      goto LABEL_617;
  }
  networkPrimaryIpv6InterfaceName = self->_networkPrimaryIpv6InterfaceName;
  if ((unint64_t)networkPrimaryIpv6InterfaceName | *((_QWORD *)v4 + 112))
  {
    if (!-[NSString isEqual:](networkPrimaryIpv6InterfaceName, "isEqual:"))
      goto LABEL_617;
  }
  networkPrimaryIpv6ServiceName = self->_networkPrimaryIpv6ServiceName;
  if ((unint64_t)networkPrimaryIpv6ServiceName | *((_QWORD *)v4 + 113))
  {
    if (!-[NSString isEqual:](networkPrimaryIpv6ServiceName, "isEqual:"))
      goto LABEL_617;
  }
  uploadStartRadioFrequency = self->_uploadStartRadioFrequency;
  if ((unint64_t)uploadStartRadioFrequency | *((_QWORD *)v4 + 181))
  {
    if (!-[NSString isEqual:](uploadStartRadioFrequency, "isEqual:"))
      goto LABEL_617;
  }
  uploadEndRadioFrequency = self->_uploadEndRadioFrequency;
  if ((unint64_t)uploadEndRadioFrequency | *((_QWORD *)v4 + 152))
  {
    if (!-[NSString isEqual:](uploadEndRadioFrequency, "isEqual:"))
      goto LABEL_617;
  }
  downloadError = self->_downloadError;
  if ((unint64_t)downloadError | *((_QWORD *)v4 + 81))
  {
    if (!-[NSString isEqual:](downloadError, "isEqual:"))
      goto LABEL_617;
  }
  networkQualityError = self->_networkQualityError;
  if ((unint64_t)networkQualityError | *((_QWORD *)v4 + 115))
  {
    if (!-[NSString isEqual:](networkQualityError, "isEqual:"))
      goto LABEL_617;
  }
  networkQualityDownloadSpeed = self->_networkQualityDownloadSpeed;
  if ((unint64_t)networkQualityDownloadSpeed | *((_QWORD *)v4 + 114))
  {
    if (!-[NSString isEqual:](networkQualityDownloadSpeed, "isEqual:"))
      goto LABEL_617;
  }
  networkQualityUploadSpeed = self->_networkQualityUploadSpeed;
  if ((unint64_t)networkQualityUploadSpeed | *((_QWORD *)v4 + 120))
  {
    if (!-[NSString isEqual:](networkQualityUploadSpeed, "isEqual:"))
      goto LABEL_617;
  }
  networkQualityRating = self->_networkQualityRating;
  if ((unint64_t)networkQualityRating | *((_QWORD *)v4 + 118))
  {
    if (!-[NSString isEqual:](networkQualityRating, "isEqual:"))
      goto LABEL_617;
  }
  vpnConnectionState = self->_vpnConnectionState;
  if ((unint64_t)vpnConnectionState | *((_QWORD *)v4 + 183))
  {
    if (!-[NSString isEqual:](vpnConnectionState, "isEqual:"))
      goto LABEL_617;
  }
  uploadError = self->_uploadError;
  if ((unint64_t)uploadError | *((_QWORD *)v4 + 154))
  {
    if (!-[NSString isEqual:](uploadError, "isEqual:"))
      goto LABEL_617;
  }
  uploadErrorDomain = self->_uploadErrorDomain;
  if ((unint64_t)uploadErrorDomain | *((_QWORD *)v4 + 156))
  {
    if (!-[NSString isEqual:](uploadErrorDomain, "isEqual:"))
      goto LABEL_617;
  }
  uploadErrorCode = self->_uploadErrorCode;
  if ((unint64_t)uploadErrorCode | *((_QWORD *)v4 + 155))
  {
    if (!-[NSString isEqual:](uploadErrorCode, "isEqual:"))
      goto LABEL_617;
  }
  downloadErrorDomain = self->_downloadErrorDomain;
  if ((unint64_t)downloadErrorDomain | *((_QWORD *)v4 + 83))
  {
    if (!-[NSString isEqual:](downloadErrorDomain, "isEqual:"))
      goto LABEL_617;
  }
  downloadErrorCode = self->_downloadErrorCode;
  if ((unint64_t)downloadErrorCode | *((_QWORD *)v4 + 82))
  {
    if (!-[NSString isEqual:](downloadErrorCode, "isEqual:"))
      goto LABEL_617;
  }
  pingError = self->_pingError;
  if ((unint64_t)pingError | *((_QWORD *)v4 + 124))
  {
    if (!-[NSString isEqual:](pingError, "isEqual:"))
      goto LABEL_617;
  }
  pingErrorDomain = self->_pingErrorDomain;
  if ((unint64_t)pingErrorDomain | *((_QWORD *)v4 + 126))
  {
    if (!-[NSString isEqual:](pingErrorDomain, "isEqual:"))
      goto LABEL_617;
  }
  pingErrorCode = self->_pingErrorCode;
  if ((unint64_t)pingErrorCode | *((_QWORD *)v4 + 125))
  {
    if (!-[NSString isEqual:](pingErrorCode, "isEqual:"))
      goto LABEL_617;
  }
  networkQualityErrorDomain = self->_networkQualityErrorDomain;
  if ((unint64_t)networkQualityErrorDomain | *((_QWORD *)v4 + 117))
  {
    if (!-[NSString isEqual:](networkQualityErrorDomain, "isEqual:"))
      goto LABEL_617;
  }
  networkQualityErrorCode = self->_networkQualityErrorCode;
  if ((unint64_t)networkQualityErrorCode | *((_QWORD *)v4 + 116))
  {
    if (!-[NSString isEqual:](networkQualityErrorCode, "isEqual:"))
      goto LABEL_617;
  }
  cellularRnMobileCountryCode = self->_cellularRnMobileCountryCode;
  if ((unint64_t)cellularRnMobileCountryCode | *((_QWORD *)v4 + 59))
  {
    if (!-[NSString isEqual:](cellularRnMobileCountryCode, "isEqual:"))
      goto LABEL_617;
  }
  cellularRnMobileNetworkCode = self->_cellularRnMobileNetworkCode;
  if ((unint64_t)cellularRnMobileNetworkCode | *((_QWORD *)v4 + 60))
  {
    if (!-[NSString isEqual:](cellularRnMobileNetworkCode, "isEqual:"))
      goto LABEL_617;
  }
  v207 = *((_DWORD *)v4 + 421);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    if ((v207 & 0x100) != 0)
    {
      if (self->_cellularDataIsEnabled)
      {
        if (!*((_BYTE *)v4 + 1663))
          goto LABEL_617;
        goto LABEL_581;
      }
      if (!*((_BYTE *)v4 + 1663))
        goto LABEL_581;
    }
LABEL_617:
    v226 = 0;
    goto LABEL_618;
  }
  if ((v207 & 0x100) != 0)
    goto LABEL_617;
LABEL_581:
  downloadStartCellularEstimate = self->_downloadStartCellularEstimate;
  if ((unint64_t)downloadStartCellularEstimate | *((_QWORD *)v4 + 105)
    && !-[NSString isEqual:](downloadStartCellularEstimate, "isEqual:"))
  {
    goto LABEL_617;
  }
  downloadEndCellularEstimate = self->_downloadEndCellularEstimate;
  if ((unint64_t)downloadEndCellularEstimate | *((_QWORD *)v4 + 76))
  {
    if (!-[NSString isEqual:](downloadEndCellularEstimate, "isEqual:"))
      goto LABEL_617;
  }
  downloadMaxCellularEstimate = self->_downloadMaxCellularEstimate;
  if ((unint64_t)downloadMaxCellularEstimate | *((_QWORD *)v4 + 87))
  {
    if (!-[NSString isEqual:](downloadMaxCellularEstimate, "isEqual:"))
      goto LABEL_617;
  }
  uploadStartCellularEstimate = self->_uploadStartCellularEstimate;
  if ((unint64_t)uploadStartCellularEstimate | *((_QWORD *)v4 + 178))
  {
    if (!-[NSString isEqual:](uploadStartCellularEstimate, "isEqual:"))
      goto LABEL_617;
  }
  uploadEndCellularEstimate = self->_uploadEndCellularEstimate;
  if ((unint64_t)uploadEndCellularEstimate | *((_QWORD *)v4 + 149))
  {
    if (!-[NSString isEqual:](uploadEndCellularEstimate, "isEqual:"))
      goto LABEL_617;
  }
  uploadMaxCellularEstimate = self->_uploadMaxCellularEstimate;
  if ((unint64_t)uploadMaxCellularEstimate | *((_QWORD *)v4 + 160))
  {
    if (!-[NSString isEqual:](uploadMaxCellularEstimate, "isEqual:"))
      goto LABEL_617;
  }
  downloadResponsiveness = self->_downloadResponsiveness;
  if ((unint64_t)downloadResponsiveness | *((_QWORD *)v4 + 96))
  {
    if (!-[NSString isEqual:](downloadResponsiveness, "isEqual:"))
      goto LABEL_617;
  }
  downloadResponsivenessConfidence = self->_downloadResponsivenessConfidence;
  if ((unint64_t)downloadResponsivenessConfidence | *((_QWORD *)v4 + 97))
  {
    if (!-[NSString isEqual:](downloadResponsivenessConfidence, "isEqual:"))
      goto LABEL_617;
  }
  downloadResponsivenessRating = self->_downloadResponsivenessRating;
  if ((unint64_t)downloadResponsivenessRating | *((_QWORD *)v4 + 98))
  {
    if (!-[NSString isEqual:](downloadResponsivenessRating, "isEqual:"))
      goto LABEL_617;
  }
  downloadSpeedConfidence = self->_downloadSpeedConfidence;
  if ((unint64_t)downloadSpeedConfidence | *((_QWORD *)v4 + 102))
  {
    if (!-[NSString isEqual:](downloadSpeedConfidence, "isEqual:"))
      goto LABEL_617;
  }
  downloadSpeedRating = self->_downloadSpeedRating;
  if ((unint64_t)downloadSpeedRating | *((_QWORD *)v4 + 103))
  {
    if (!-[NSString isEqual:](downloadSpeedRating, "isEqual:"))
      goto LABEL_617;
  }
  uploadResponsiveness = self->_uploadResponsiveness;
  if ((unint64_t)uploadResponsiveness | *((_QWORD *)v4 + 169))
  {
    if (!-[NSString isEqual:](uploadResponsiveness, "isEqual:"))
      goto LABEL_617;
  }
  uploadResponsivenessConfidence = self->_uploadResponsivenessConfidence;
  if ((unint64_t)uploadResponsivenessConfidence | *((_QWORD *)v4 + 170))
  {
    if (!-[NSString isEqual:](uploadResponsivenessConfidence, "isEqual:"))
      goto LABEL_617;
  }
  uploadResponsivenessRating = self->_uploadResponsivenessRating;
  if ((unint64_t)uploadResponsivenessRating | *((_QWORD *)v4 + 171))
  {
    if (!-[NSString isEqual:](uploadResponsivenessRating, "isEqual:"))
      goto LABEL_617;
  }
  uploadSpeedConfidence = self->_uploadSpeedConfidence;
  if ((unint64_t)uploadSpeedConfidence | *((_QWORD *)v4 + 175))
  {
    if (!-[NSString isEqual:](uploadSpeedConfidence, "isEqual:"))
      goto LABEL_617;
  }
  uploadSpeedRating = self->_uploadSpeedRating;
  if ((unint64_t)uploadSpeedRating | *((_QWORD *)v4 + 176))
  {
    if (!-[NSString isEqual:](uploadSpeedRating, "isEqual:"))
      goto LABEL_617;
  }
  wifiChannelBand = self->_wifiChannelBand;
  if ((unint64_t)wifiChannelBand | *((_QWORD *)v4 + 191))
  {
    if (!-[NSString isEqual:](wifiChannelBand, "isEqual:"))
      goto LABEL_617;
  }
  wifiChannelWidth = self->_wifiChannelWidth;
  if ((unint64_t)wifiChannelWidth | *((_QWORD *)v4 + 192))
    v226 = -[NSString isEqual:](wifiChannelWidth, "isEqual:");
  else
    v226 = 1;
LABEL_618:

  return v226;
}

- (unint64_t)hash
{
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 has;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v4;
  $0FF3A8E67B3D88A75EBF7BE240CB1B75 v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  NSUInteger v64;
  NSUInteger v65;
  NSUInteger v66;
  uint64_t v67;
  NSUInteger v68;
  NSUInteger v69;
  NSUInteger v70;
  NSUInteger v71;
  NSUInteger v72;
  NSUInteger v73;
  NSUInteger v74;
  NSUInteger v75;
  NSUInteger v76;
  NSUInteger v77;
  uint64_t v78;
  NSUInteger v79;
  NSUInteger v80;
  NSUInteger v81;
  NSUInteger v82;
  NSUInteger v83;
  NSUInteger v84;
  NSUInteger v85;
  NSUInteger v86;
  NSUInteger v87;
  NSUInteger v88;
  NSUInteger v89;
  NSUInteger v90;
  uint64_t v91;
  NSUInteger v92;
  NSUInteger v93;
  NSUInteger v94;
  NSUInteger v95;
  NSUInteger v96;
  NSUInteger v97;
  NSUInteger v98;
  NSUInteger v99;
  NSUInteger v100;
  NSUInteger v101;
  NSUInteger v102;
  NSUInteger v103;
  NSUInteger v104;
  NSUInteger v105;
  NSUInteger v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSUInteger v113;
  NSUInteger v114;
  NSUInteger v115;
  NSUInteger v116;
  NSUInteger v117;
  NSUInteger v118;
  NSUInteger v119;
  NSUInteger v120;
  NSUInteger v121;
  NSUInteger v122;
  NSUInteger v123;
  NSUInteger v124;
  uint64_t v125;
  NSUInteger v126;
  NSUInteger v127;
  NSUInteger v128;
  uint64_t v129;
  NSUInteger v130;
  NSUInteger v131;
  NSUInteger v132;
  NSUInteger v133;
  NSUInteger v134;
  NSUInteger v135;
  NSUInteger v136;
  NSUInteger v137;
  NSUInteger v138;
  NSUInteger v139;
  NSUInteger v140;
  NSUInteger v141;
  NSUInteger v142;
  NSUInteger v143;
  NSUInteger v144;
  NSUInteger v145;
  NSUInteger v146;
  NSUInteger v147;
  uint64_t v148;
  NSUInteger v149;
  NSUInteger v150;
  NSUInteger v151;
  NSUInteger v152;
  NSUInteger v153;
  NSUInteger v154;
  NSUInteger v155;
  NSUInteger v156;
  NSUInteger v157;
  NSUInteger v158;
  NSUInteger v159;
  NSUInteger v160;
  NSUInteger v161;
  NSUInteger v162;
  NSUInteger v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSUInteger v170;
  NSUInteger v171;
  NSUInteger v172;
  NSUInteger v173;
  NSUInteger v174;
  NSUInteger v175;
  NSUInteger v176;
  NSUInteger v177;
  NSUInteger v178;
  NSUInteger v179;
  NSUInteger v180;
  NSUInteger v181;
  NSUInteger v182;
  NSUInteger v183;
  NSUInteger v184;
  NSUInteger v185;
  NSUInteger v186;
  NSUInteger v187;
  NSUInteger v188;
  NSUInteger v189;
  NSUInteger v190;
  NSUInteger v191;
  NSUInteger v192;
  NSUInteger v193;
  NSUInteger v194;
  NSUInteger v195;
  NSUInteger v196;
  NSUInteger v197;
  NSUInteger v198;
  NSUInteger v199;
  NSUInteger v200;
  NSUInteger v201;
  NSUInteger v202;
  NSUInteger v203;
  NSUInteger v204;
  NSUInteger v205;
  NSUInteger v206;
  NSUInteger v207;
  NSUInteger v208;
  NSUInteger v209;
  NSUInteger v210;
  NSUInteger v211;
  NSUInteger v212;
  NSUInteger v213;
  NSUInteger v214;
  NSUInteger v215;
  NSUInteger v216;
  NSUInteger v217;
  NSUInteger v218;
  NSUInteger v219;
  NSUInteger v220;
  NSUInteger v221;
  uint64_t v222;
  NSUInteger v223;
  NSUInteger v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  NSUInteger v229;
  NSUInteger v230;
  NSUInteger v231;
  NSUInteger v232;
  NSUInteger v233;
  uint64_t v234;
  NSUInteger v235;
  NSUInteger v236;
  NSUInteger v237;
  unint64_t v238;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v238 = 2654435761u * self->_timestamp;
  else
    v238 = 0;
  v237 = -[NSString hash](self->_awdlElectionParameters, "hash");
  v236 = -[NSString hash](self->_awdlMasterChannel, "hash");
  v235 = -[NSString hash](self->_awdlOpMode, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v234 = 2654435761 * self->_awdlPowerState;
  else
    v234 = 0;
  v233 = -[NSString hash](self->_awdlSchedule, "hash");
  v232 = -[NSString hash](self->_awdlSecondaryMasterChannel, "hash");
  v231 = -[NSString hash](self->_awdlSyncChannelSequence, "hash");
  v230 = -[NSString hash](self->_awdlSyncState, "hash");
  v229 = -[NSString hash](self->_btConnectedDevicesCount, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v228 = 2654435761 * self->_btIsConnectable;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_9:
      v227 = 2654435761 * self->_btIsDiscoverable;
      if ((*(_BYTE *)&has & 0x20) != 0)
        goto LABEL_10;
LABEL_14:
      v226 = 0;
      if ((*(_BYTE *)&has & 0x40) != 0)
        goto LABEL_11;
      goto LABEL_15;
    }
  }
  else
  {
    v228 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_9;
  }
  v227 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_14;
LABEL_10:
  v226 = 2654435761 * self->_btIsPowerOn;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_11:
    v225 = 2654435761 * self->_btIsScanning;
    goto LABEL_16;
  }
LABEL_15:
  v225 = 0;
LABEL_16:
  v224 = -[NSString hash](self->_callingClient, "hash");
  v223 = -[NSString hash](self->_cellularActiveContexts, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v222 = 2654435761 * self->_cellularAllowsVoip;
  else
    v222 = 0;
  v221 = -[NSString hash](self->_cellularAttached, "hash");
  v220 = -[NSString hash](self->_cellularBandinfo, "hash");
  v219 = -[NSString hash](self->_cellularBandwidth, "hash");
  v218 = -[NSString hash](self->_cellularCarrierName, "hash");
  v217 = -[NSString hash](self->_cellularDataBearerSoMask, "hash");
  v216 = -[NSString hash](self->_cellularDataBearerTechnology, "hash");
  v215 = -[NSString hash](self->_cellularDataPlanSignalingReductionOverride, "hash");
  v214 = -[NSString hash](self->_cellularDataPossible, "hash");
  v213 = -[NSString hash](self->_cellularInHomeCountry, "hash");
  v212 = -[NSString hash](self->_cellularIndicator, "hash");
  v211 = -[NSString hash](self->_cellularIndicatorOverride, "hash");
  v210 = -[NSString hash](self->_cellularIsoCountryCode, "hash");
  v209 = -[NSString hash](self->_cellularLqm, "hash");
  v208 = -[NSString hash](self->_cellularLteMaxScheduledLayers, "hash");
  v207 = -[NSString hash](self->_cellularMobileCountryCode, "hash");
  v206 = -[NSString hash](self->_cellularMobileNetworkCode, "hash");
  v205 = -[NSString hash](self->_cellularNewRadioCoverage, "hash");
  v204 = -[NSString hash](self->_cellularNewRadioDataBearer, "hash");
  v203 = -[NSString hash](self->_cellularNewRadioMmwaveDataBearer, "hash");
  v202 = -[NSString hash](self->_cellularNewRadioNsaCoverage, "hash");
  v201 = -[NSString hash](self->_cellularNewRadioNsaDataBearer, "hash");
  v200 = -[NSString hash](self->_cellularNewRadioSaCoverage, "hash");
  v199 = -[NSString hash](self->_cellularNewRadioSaDataBearer, "hash");
  v198 = -[NSString hash](self->_cellularNewRadioSub6DataBearer, "hash");
  v197 = -[NSString hash](self->_cellularNrConfiguredBw, "hash");
  v196 = -[NSString hash](self->_cellularNrLayers, "hash");
  v195 = -[NSString hash](self->_cellularNrModulation, "hash");
  v194 = -[NSString hash](self->_cellularNrRsrp, "hash");
  v193 = -[NSString hash](self->_cellularNrRsrq, "hash");
  v192 = -[NSString hash](self->_cellularNrSnr, "hash");
  v191 = -[NSString hash](self->_cellularPid, "hash");
  v190 = -[NSString hash](self->_cellularRadioAccessTechnology, "hash");
  v189 = -[NSString hash](self->_cellularRadioAccessTechnologyCtDataStatus, "hash");
  v188 = -[NSString hash](self->_cellularRoamAllowed, "hash");
  v187 = -[NSString hash](self->_cellularRsrp, "hash");
  v186 = -[NSString hash](self->_cellularSnr, "hash");
  v185 = -[NSString hash](self->_cellularTac, "hash");
  v184 = -[NSString hash](self->_cellularTotalActiveContexts, "hash");
  v183 = -[NSString hash](self->_cellularTotalBw, "hash");
  v182 = -[NSString hash](self->_cellularTotalCcs, "hash");
  v181 = -[NSString hash](self->_cellularTotalLayers, "hash");
  v180 = -[NSString hash](self->_cellularUarfcn, "hash");
  v179 = -[NSString hash](self->_downloadCdnPop, "hash");
  v178 = -[NSString hash](self->_downloadCdnUuid, "hash");
  v177 = -[NSString hash](self->_downloadConnectionTime, "hash");
  v176 = -[NSString hash](self->_downloadDomainLookupTime, "hash");
  v175 = -[NSString hash](self->_downloadEndDataBearerTechnology, "hash");
  v174 = -[NSString hash](self->_downloadEndPrimaryIpv4Interface, "hash");
  v173 = -[NSString hash](self->_downloadEndRat, "hash");
  v172 = -[NSString hash](self->_downloadFileSize, "hash");
  v171 = -[NSString hash](self->_downloadInterfaceName, "hash");
  v170 = -[NSString hash](self->_downloadInterfaceServiceName, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    v169 = 2654435761 * self->_downloadIsCellular;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_21:
      v168 = 2654435761 * self->_downloadIsConstrained;
      if ((*(_WORD *)&v4 & 0x800) != 0)
        goto LABEL_22;
      goto LABEL_28;
    }
  }
  else
  {
    v169 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_21;
  }
  v168 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_22:
    v167 = 2654435761 * self->_downloadIsExpensive;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_23;
    goto LABEL_29;
  }
LABEL_28:
  v167 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_23:
    v166 = 2654435761 * self->_downloadIsMultipath;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_24;
LABEL_30:
    v165 = 0;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_25;
    goto LABEL_31;
  }
LABEL_29:
  v166 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
    goto LABEL_30;
LABEL_24:
  v165 = 2654435761 * self->_downloadIsProxyConnection;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_25:
    v164 = 2654435761 * self->_downloadIsReusedConnection;
    goto LABEL_32;
  }
LABEL_31:
  v164 = 0;
LABEL_32:
  v163 = -[NSString hash](self->_downloadMaxSpeedObserved, "hash");
  v162 = -[NSString hash](self->_downloadNumberOfStreams, "hash");
  v161 = -[NSString hash](self->_downloadProtocolName, "hash");
  v160 = -[NSString hash](self->_downloadRemoteAddress, "hash");
  v159 = -[NSString hash](self->_downloadRemotePort, "hash");
  v158 = -[NSString hash](self->_downloadRequestTime, "hash");
  v157 = -[NSString hash](self->_downloadRequestToResponseTime, "hash");
  v156 = -[NSString hash](self->_downloadResponseTime, "hash");
  v155 = -[NSString hash](self->_downloadSecureConnectionTime, "hash");
  v154 = -[NSString hash](self->_downloadServer, "hash");
  v153 = -[NSString hash](self->_downloadSpeed, "hash");
  v152 = -[NSString hash](self->_downloadStableSpeed, "hash");
  v151 = -[NSString hash](self->_downloadStartDataBearerTechnology, "hash");
  v150 = -[NSString hash](self->_downloadStartPrimaryIpv4Interface, "hash");
  v149 = -[NSString hash](self->_downloadStartRat, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v148 = 2654435761 * self->_networkIsAppleReachable;
  else
    v148 = 0;
  v147 = -[NSString hash](self->_networkPrimaryIpv4InterfaceName, "hash");
  v146 = -[NSString hash](self->_networkPrimaryIpv4ServiceName, "hash");
  v145 = -[NSString hash](self->_nptkitFrameworkVersion, "hash");
  v144 = -[NSString hash](self->_performanceTestStartTime, "hash");
  v143 = -[NSString hash](self->_pingAddress, "hash");
  v142 = -[NSString hash](self->_pingLossPercent, "hash");
  v141 = -[NSString hash](self->_pingMaxLatency, "hash");
  v140 = -[NSString hash](self->_pingMeanLatency, "hash");
  v139 = -[NSString hash](self->_pingMinLatency, "hash");
  v138 = -[NSString hash](self->_pingStandardDeviation, "hash");
  v137 = -[NSString hash](self->_powerBatteryWarningLevel, "hash");
  v136 = -[NSString hash](self->_powerSourceType, "hash");
  v135 = -[NSString hash](self->_powerStateCaps, "hash");
  v134 = -[NSString hash](self->_systemActiveProcessorCount, "hash");
  v133 = -[NSString hash](self->_systemBatteryLevel, "hash");
  v132 = -[NSString hash](self->_systemBatteryState, "hash");
  v131 = -[NSString hash](self->_systemDeviceClass, "hash");
  v130 = -[NSString hash](self->_systemDeviceModel, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v129 = 2654435761 * self->_systemLowPowerModeEnabled;
  else
    v129 = 0;
  v128 = -[NSString hash](self->_systemName, "hash");
  v127 = -[NSString hash](self->_systemOsVariant, "hash");
  v126 = -[NSString hash](self->_systemPhysicalMemory, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v125 = 2654435761 * self->_systemPowersourceConnected;
  else
    v125 = 0;
  v124 = -[NSString hash](self->_systemProcessorCount, "hash");
  v123 = -[NSString hash](self->_systemVersion, "hash");
  v122 = -[NSString hash](self->_uploadCdnPop, "hash");
  v121 = -[NSString hash](self->_uploadCdnUuid, "hash");
  v120 = -[NSString hash](self->_uploadConnectionTime, "hash");
  v119 = -[NSString hash](self->_uploadDomainLookupTime, "hash");
  v118 = -[NSString hash](self->_uploadEndDataBearerTechnology, "hash");
  v117 = -[NSString hash](self->_uploadEndPrimaryIpv4Interface, "hash");
  v116 = -[NSString hash](self->_uploadEndRat, "hash");
  v115 = -[NSString hash](self->_uploadFileSize, "hash");
  v114 = -[NSString hash](self->_uploadInterfaceName, "hash");
  v113 = -[NSString hash](self->_uploadInterfaceServiceName, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    v112 = 2654435761 * self->_uploadIsCellular;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
    {
LABEL_43:
      v111 = 2654435761 * self->_uploadIsConstrained;
      if ((*(_DWORD *)&v5 & 0x100000) != 0)
        goto LABEL_44;
      goto LABEL_50;
    }
  }
  else
  {
    v112 = 0;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
      goto LABEL_43;
  }
  v111 = 0;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
LABEL_44:
    v110 = 2654435761 * self->_uploadIsExpensive;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
      goto LABEL_45;
    goto LABEL_51;
  }
LABEL_50:
  v110 = 0;
  if ((*(_DWORD *)&v5 & 0x200000) != 0)
  {
LABEL_45:
    v109 = 2654435761 * self->_uploadIsMultipath;
    if ((*(_DWORD *)&v5 & 0x400000) != 0)
      goto LABEL_46;
LABEL_52:
    v108 = 0;
    if ((*(_DWORD *)&v5 & 0x800000) != 0)
      goto LABEL_47;
    goto LABEL_53;
  }
LABEL_51:
  v109 = 0;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
    goto LABEL_52;
LABEL_46:
  v108 = 2654435761 * self->_uploadIsProxyConnection;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_47:
    v107 = 2654435761 * self->_uploadIsReusedConnection;
    goto LABEL_54;
  }
LABEL_53:
  v107 = 0;
LABEL_54:
  v106 = -[NSString hash](self->_uploadMaxSpeedObserved, "hash");
  v105 = -[NSString hash](self->_uploadNumberOfStreams, "hash");
  v104 = -[NSString hash](self->_uploadProtocolName, "hash");
  v103 = -[NSString hash](self->_uploadRemoteAddress, "hash");
  v102 = -[NSString hash](self->_uploadRemotePort, "hash");
  v101 = -[NSString hash](self->_uploadRequestTime, "hash");
  v100 = -[NSString hash](self->_uploadRequestToResponseTime, "hash");
  v99 = -[NSString hash](self->_uploadResponseTime, "hash");
  v98 = -[NSString hash](self->_uploadSecureConnectionTime, "hash");
  v97 = -[NSString hash](self->_uploadServer, "hash");
  v96 = -[NSString hash](self->_uploadSpeed, "hash");
  v95 = -[NSString hash](self->_uploadStableSpeed, "hash");
  v94 = -[NSString hash](self->_uploadStartDataBearerTechnology, "hash");
  v93 = -[NSString hash](self->_uploadStartPrimaryIpv4Interface, "hash");
  v92 = -[NSString hash](self->_uploadStartRat, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    v91 = 2654435761 * self->_useWifiWasSpecified;
  else
    v91 = 0;
  v90 = -[NSString hash](self->_wifiAveragePhyRateRx, "hash");
  v89 = -[NSString hash](self->_wifiAverageRssi, "hash");
  v88 = -[NSString hash](self->_wifiAverageSnr, "hash");
  v87 = -[NSString hash](self->_wifiAverageTcpRtt, "hash");
  v86 = -[NSString hash](self->_wifiBtcMode, "hash");
  v85 = -[NSString hash](self->_wifiCca, "hash");
  v84 = -[NSString hash](self->_wifiChannel, "hash");
  v83 = -[NSString hash](self->_wifiCwfCca, "hash");
  v82 = -[NSString hash](self->_wifiEapolControlMode, "hash");
  v81 = -[NSString hash](self->_wifiEapolSupplicantState, "hash");
  v80 = -[NSString hash](self->_wifiGuardInterval, "hash");
  v79 = -[NSString hash](self->_wifiHiddenState, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
    v78 = 2654435761 * self->_wifiIsCaptive;
  else
    v78 = 0;
  v77 = -[NSString hash](self->_wifiMcsIndex, "hash");
  v76 = -[NSString hash](self->_wifiNoise, "hash");
  v75 = -[NSString hash](self->_wifiNumberOfSpatialStreams, "hash");
  v74 = -[NSString hash](self->_wifiOpMode, "hash");
  v73 = -[NSString hash](self->_wifiPhyMode, "hash");
  v72 = -[NSString hash](self->_wifiRssi, "hash");
  v71 = -[NSString hash](self->_wifiSecurity, "hash");
  v70 = -[NSString hash](self->_wifiTxRate, "hash");
  v69 = -[NSString hash](self->_wrmChannelType, "hash");
  v68 = -[NSString hash](self->_cellularCellid, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v67 = 2654435761 * self->_acceptablePerformanceResult;
  else
    v67 = 0;
  v66 = -[NSString hash](self->_networkQualityResponsiveness, "hash");
  v65 = -[NSString hash](self->_cellularAggregatedDLBW, "hash");
  v64 = -[NSString hash](self->_cellularAggregatedULBW, "hash");
  v63 = -[NSString hash](self->_cellularIssa, "hash");
  v62 = -[NSString hash](self->_cellularLac, "hash");
  v61 = -[NSString hash](self->_cellularLteNrConfiguredBw, "hash");
  v60 = -[NSString hash](self->_cellularMaxDlMod, "hash");
  v59 = -[NSString hash](self->_cellularMaxNwMimoLyr, "hash");
  v58 = -[NSString hash](self->_cellularMaxSchdMimoLyr, "hash");
  v57 = -[NSString hash](self->_cellularMaxUeRank, "hash");
  v56 = -[NSString hash](self->_cellularMaxUlMod, "hash");
  v55 = -[NSString hash](self->_cellularNrSinr, "hash");
  v54 = -[NSString hash](self->_cellularNrarfcn, "hash");
  v53 = -[NSString hash](self->_cellularRadioFrequency, "hash");
  v52 = -[NSString hash](self->_cellularTotalDlMimoLayers, "hash");
  v51 = -[NSString hash](self->_cellularTotalNumCcs, "hash");
  v50 = -[NSString hash](self->_downloadStartRadioFrequency, "hash");
  v49 = -[NSString hash](self->_downloadEndRadioFrequency, "hash");
  v48 = -[NSString hash](self->_networkPrimaryIpv6InterfaceName, "hash");
  v47 = -[NSString hash](self->_networkPrimaryIpv6ServiceName, "hash");
  v46 = -[NSString hash](self->_uploadStartRadioFrequency, "hash");
  v45 = -[NSString hash](self->_uploadEndRadioFrequency, "hash");
  v44 = -[NSString hash](self->_downloadError, "hash");
  v43 = -[NSString hash](self->_networkQualityError, "hash");
  v42 = -[NSString hash](self->_networkQualityDownloadSpeed, "hash");
  v41 = -[NSString hash](self->_networkQualityUploadSpeed, "hash");
  v40 = -[NSString hash](self->_networkQualityRating, "hash");
  v39 = -[NSString hash](self->_vpnConnectionState, "hash");
  v38 = -[NSString hash](self->_uploadError, "hash");
  v37 = -[NSString hash](self->_uploadErrorDomain, "hash");
  v36 = -[NSString hash](self->_uploadErrorCode, "hash");
  v6 = -[NSString hash](self->_downloadErrorDomain, "hash");
  v7 = -[NSString hash](self->_downloadErrorCode, "hash");
  v8 = -[NSString hash](self->_pingError, "hash");
  v9 = -[NSString hash](self->_pingErrorDomain, "hash");
  v10 = -[NSString hash](self->_pingErrorCode, "hash");
  v11 = -[NSString hash](self->_networkQualityErrorDomain, "hash");
  v12 = -[NSString hash](self->_networkQualityErrorCode, "hash");
  v13 = -[NSString hash](self->_cellularRnMobileCountryCode, "hash");
  v14 = -[NSString hash](self->_cellularRnMobileNetworkCode, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v15 = 2654435761 * self->_cellularDataIsEnabled;
  else
    v15 = 0;
  v16 = v237 ^ v238 ^ v236 ^ v235 ^ v234 ^ v233 ^ v232 ^ v231 ^ v230 ^ v229 ^ v228 ^ v227 ^ v226 ^ v225 ^ v224 ^ v223 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153;
  v17 = v16 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38;
  v18 = v37 ^ v36 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_downloadStartCellularEstimate, "hash");
  v19 = v18 ^ -[NSString hash](self->_downloadEndCellularEstimate, "hash");
  v20 = v19 ^ -[NSString hash](self->_downloadMaxCellularEstimate, "hash");
  v21 = v20 ^ -[NSString hash](self->_uploadStartCellularEstimate, "hash");
  v22 = v21 ^ -[NSString hash](self->_uploadEndCellularEstimate, "hash");
  v23 = v22 ^ -[NSString hash](self->_uploadMaxCellularEstimate, "hash");
  v24 = v23 ^ -[NSString hash](self->_downloadResponsiveness, "hash");
  v25 = v17 ^ v24 ^ -[NSString hash](self->_downloadResponsivenessConfidence, "hash");
  v26 = -[NSString hash](self->_downloadResponsivenessRating, "hash");
  v27 = v26 ^ -[NSString hash](self->_downloadSpeedConfidence, "hash");
  v28 = v27 ^ -[NSString hash](self->_downloadSpeedRating, "hash");
  v29 = v28 ^ -[NSString hash](self->_uploadResponsiveness, "hash");
  v30 = v29 ^ -[NSString hash](self->_uploadResponsivenessConfidence, "hash");
  v31 = v30 ^ -[NSString hash](self->_uploadResponsivenessRating, "hash");
  v32 = v31 ^ -[NSString hash](self->_uploadSpeedConfidence, "hash");
  v33 = v32 ^ -[NSString hash](self->_uploadSpeedRating, "hash");
  v34 = v33 ^ -[NSString hash](self->_wifiChannelBand, "hash");
  return v25 ^ v34 ^ -[NSString hash](self->_wifiChannelWidth, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  id v8;

  v4 = a3;
  if ((*((_BYTE *)v4 + 1684) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[AWDNetworkPerformanceMetric setAwdlElectionParameters:](self, "setAwdlElectionParameters:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[AWDNetworkPerformanceMetric setAwdlMasterChannel:](self, "setAwdlMasterChannel:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[AWDNetworkPerformanceMetric setAwdlOpMode:](self, "setAwdlOpMode:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1684) & 4) != 0)
  {
    self->_awdlPowerState = *((_BYTE *)v4 + 1657);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDNetworkPerformanceMetric setAwdlSchedule:](self, "setAwdlSchedule:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[AWDNetworkPerformanceMetric setAwdlSecondaryMasterChannel:](self, "setAwdlSecondaryMasterChannel:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[AWDNetworkPerformanceMetric setAwdlSyncChannelSequence:](self, "setAwdlSyncChannelSequence:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[AWDNetworkPerformanceMetric setAwdlSyncState:](self, "setAwdlSyncState:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[AWDNetworkPerformanceMetric setBtConnectedDevicesCount:](self, "setBtConnectedDevicesCount:");
    v4 = v8;
  }
  v5 = *((_DWORD *)v4 + 421);
  if ((v5 & 8) != 0)
  {
    self->_btIsConnectable = *((_BYTE *)v4 + 1658);
    *(_DWORD *)&self->_has |= 8u;
    v5 = *((_DWORD *)v4 + 421);
    if ((v5 & 0x10) == 0)
    {
LABEL_23:
      if ((v5 & 0x20) == 0)
        goto LABEL_24;
      goto LABEL_453;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  self->_btIsDiscoverable = *((_BYTE *)v4 + 1659);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 421);
  if ((v5 & 0x20) == 0)
  {
LABEL_24:
    if ((v5 & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_453:
  self->_btIsPowerOn = *((_BYTE *)v4 + 1660);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 421) & 0x40) != 0)
  {
LABEL_25:
    self->_btIsScanning = *((_BYTE *)v4 + 1661);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_26:
  if (*((_QWORD *)v4 + 10))
  {
    -[AWDNetworkPerformanceMetric setCallingClient:](self, "setCallingClient:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[AWDNetworkPerformanceMetric setCellularActiveContexts:](self, "setCellularActiveContexts:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1684) & 0x80) != 0)
  {
    self->_cellularAllowsVoip = *((_BYTE *)v4 + 1662);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[AWDNetworkPerformanceMetric setCellularAttached:](self, "setCellularAttached:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[AWDNetworkPerformanceMetric setCellularBandinfo:](self, "setCellularBandinfo:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[AWDNetworkPerformanceMetric setCellularBandwidth:](self, "setCellularBandwidth:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[AWDNetworkPerformanceMetric setCellularCarrierName:](self, "setCellularCarrierName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[AWDNetworkPerformanceMetric setCellularDataBearerSoMask:](self, "setCellularDataBearerSoMask:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[AWDNetworkPerformanceMetric setCellularDataBearerTechnology:](self, "setCellularDataBearerTechnology:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 21))
  {
    -[AWDNetworkPerformanceMetric setCellularDataPlanSignalingReductionOverride:](self, "setCellularDataPlanSignalingReductionOverride:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 22))
  {
    -[AWDNetworkPerformanceMetric setCellularDataPossible:](self, "setCellularDataPossible:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 23))
  {
    -[AWDNetworkPerformanceMetric setCellularInHomeCountry:](self, "setCellularInHomeCountry:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 24))
  {
    -[AWDNetworkPerformanceMetric setCellularIndicator:](self, "setCellularIndicator:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 25))
  {
    -[AWDNetworkPerformanceMetric setCellularIndicatorOverride:](self, "setCellularIndicatorOverride:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 26))
  {
    -[AWDNetworkPerformanceMetric setCellularIsoCountryCode:](self, "setCellularIsoCountryCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 29))
  {
    -[AWDNetworkPerformanceMetric setCellularLqm:](self, "setCellularLqm:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 30))
  {
    -[AWDNetworkPerformanceMetric setCellularLteMaxScheduledLayers:](self, "setCellularLteMaxScheduledLayers:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 37))
  {
    -[AWDNetworkPerformanceMetric setCellularMobileCountryCode:](self, "setCellularMobileCountryCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 38))
  {
    -[AWDNetworkPerformanceMetric setCellularMobileNetworkCode:](self, "setCellularMobileNetworkCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 39))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioCoverage:](self, "setCellularNewRadioCoverage:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 40))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioDataBearer:](self, "setCellularNewRadioDataBearer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 41))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioMmwaveDataBearer:](self, "setCellularNewRadioMmwaveDataBearer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 42))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioNsaCoverage:](self, "setCellularNewRadioNsaCoverage:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 43))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioNsaDataBearer:](self, "setCellularNewRadioNsaDataBearer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 44))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioSaCoverage:](self, "setCellularNewRadioSaCoverage:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 45))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioSaDataBearer:](self, "setCellularNewRadioSaDataBearer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 46))
  {
    -[AWDNetworkPerformanceMetric setCellularNewRadioSub6DataBearer:](self, "setCellularNewRadioSub6DataBearer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 47))
  {
    -[AWDNetworkPerformanceMetric setCellularNrConfiguredBw:](self, "setCellularNrConfiguredBw:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 48))
  {
    -[AWDNetworkPerformanceMetric setCellularNrLayers:](self, "setCellularNrLayers:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 49))
  {
    -[AWDNetworkPerformanceMetric setCellularNrModulation:](self, "setCellularNrModulation:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 50))
  {
    -[AWDNetworkPerformanceMetric setCellularNrRsrp:](self, "setCellularNrRsrp:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 51))
  {
    -[AWDNetworkPerformanceMetric setCellularNrRsrq:](self, "setCellularNrRsrq:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 53))
  {
    -[AWDNetworkPerformanceMetric setCellularNrSnr:](self, "setCellularNrSnr:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 55))
  {
    -[AWDNetworkPerformanceMetric setCellularPid:](self, "setCellularPid:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 56))
  {
    -[AWDNetworkPerformanceMetric setCellularRadioAccessTechnology:](self, "setCellularRadioAccessTechnology:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 57))
  {
    -[AWDNetworkPerformanceMetric setCellularRadioAccessTechnologyCtDataStatus:](self, "setCellularRadioAccessTechnologyCtDataStatus:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 61))
  {
    -[AWDNetworkPerformanceMetric setCellularRoamAllowed:](self, "setCellularRoamAllowed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 62))
  {
    -[AWDNetworkPerformanceMetric setCellularRsrp:](self, "setCellularRsrp:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 63))
  {
    -[AWDNetworkPerformanceMetric setCellularSnr:](self, "setCellularSnr:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 64))
  {
    -[AWDNetworkPerformanceMetric setCellularTac:](self, "setCellularTac:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 65))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalActiveContexts:](self, "setCellularTotalActiveContexts:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 66))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalBw:](self, "setCellularTotalBw:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 67))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalCcs:](self, "setCellularTotalCcs:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 69))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalLayers:](self, "setCellularTotalLayers:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 71))
  {
    -[AWDNetworkPerformanceMetric setCellularUarfcn:](self, "setCellularUarfcn:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 72))
  {
    -[AWDNetworkPerformanceMetric setDownloadCdnPop:](self, "setDownloadCdnPop:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 73))
  {
    -[AWDNetworkPerformanceMetric setDownloadCdnUuid:](self, "setDownloadCdnUuid:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 74))
  {
    -[AWDNetworkPerformanceMetric setDownloadConnectionTime:](self, "setDownloadConnectionTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 75))
  {
    -[AWDNetworkPerformanceMetric setDownloadDomainLookupTime:](self, "setDownloadDomainLookupTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 77))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndDataBearerTechnology:](self, "setDownloadEndDataBearerTechnology:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 78))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndPrimaryIpv4Interface:](self, "setDownloadEndPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 80))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndRat:](self, "setDownloadEndRat:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 84))
  {
    -[AWDNetworkPerformanceMetric setDownloadFileSize:](self, "setDownloadFileSize:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 85))
  {
    -[AWDNetworkPerformanceMetric setDownloadInterfaceName:](self, "setDownloadInterfaceName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 86))
  {
    -[AWDNetworkPerformanceMetric setDownloadInterfaceServiceName:](self, "setDownloadInterfaceServiceName:");
    v4 = v8;
  }
  v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x200) != 0)
  {
    self->_downloadIsCellular = *((_BYTE *)v4 + 1664);
    *(_DWORD *)&self->_has |= 0x200u;
    v6 = *((_DWORD *)v4 + 421);
    if ((v6 & 0x400) == 0)
    {
LABEL_138:
      if ((v6 & 0x800) == 0)
        goto LABEL_139;
      goto LABEL_457;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_138;
  }
  self->_downloadIsConstrained = *((_BYTE *)v4 + 1665);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x800) == 0)
  {
LABEL_139:
    if ((v6 & 0x1000) == 0)
      goto LABEL_140;
    goto LABEL_458;
  }
LABEL_457:
  self->_downloadIsExpensive = *((_BYTE *)v4 + 1666);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x1000) == 0)
  {
LABEL_140:
    if ((v6 & 0x2000) == 0)
      goto LABEL_141;
    goto LABEL_459;
  }
LABEL_458:
  self->_downloadIsMultipath = *((_BYTE *)v4 + 1667);
  *(_DWORD *)&self->_has |= 0x1000u;
  v6 = *((_DWORD *)v4 + 421);
  if ((v6 & 0x2000) == 0)
  {
LABEL_141:
    if ((v6 & 0x4000) == 0)
      goto LABEL_143;
    goto LABEL_142;
  }
LABEL_459:
  self->_downloadIsProxyConnection = *((_BYTE *)v4 + 1668);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 421) & 0x4000) != 0)
  {
LABEL_142:
    self->_downloadIsReusedConnection = *((_BYTE *)v4 + 1669);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_143:
  if (*((_QWORD *)v4 + 88))
  {
    -[AWDNetworkPerformanceMetric setDownloadMaxSpeedObserved:](self, "setDownloadMaxSpeedObserved:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 89))
  {
    -[AWDNetworkPerformanceMetric setDownloadNumberOfStreams:](self, "setDownloadNumberOfStreams:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 90))
  {
    -[AWDNetworkPerformanceMetric setDownloadProtocolName:](self, "setDownloadProtocolName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 91))
  {
    -[AWDNetworkPerformanceMetric setDownloadRemoteAddress:](self, "setDownloadRemoteAddress:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 92))
  {
    -[AWDNetworkPerformanceMetric setDownloadRemotePort:](self, "setDownloadRemotePort:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 93))
  {
    -[AWDNetworkPerformanceMetric setDownloadRequestTime:](self, "setDownloadRequestTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 94))
  {
    -[AWDNetworkPerformanceMetric setDownloadRequestToResponseTime:](self, "setDownloadRequestToResponseTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 95))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponseTime:](self, "setDownloadResponseTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 99))
  {
    -[AWDNetworkPerformanceMetric setDownloadSecureConnectionTime:](self, "setDownloadSecureConnectionTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 100))
  {
    -[AWDNetworkPerformanceMetric setDownloadServer:](self, "setDownloadServer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 101))
  {
    -[AWDNetworkPerformanceMetric setDownloadSpeed:](self, "setDownloadSpeed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 104))
  {
    -[AWDNetworkPerformanceMetric setDownloadStableSpeed:](self, "setDownloadStableSpeed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 106))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartDataBearerTechnology:](self, "setDownloadStartDataBearerTechnology:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 107))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartPrimaryIpv4Interface:](self, "setDownloadStartPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 109))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartRat:](self, "setDownloadStartRat:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1685) & 0x80) != 0)
  {
    self->_networkIsAppleReachable = *((_BYTE *)v4 + 1670);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((_QWORD *)v4 + 110))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv4InterfaceName:](self, "setNetworkPrimaryIpv4InterfaceName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 111))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv4ServiceName:](self, "setNetworkPrimaryIpv4ServiceName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 121))
  {
    -[AWDNetworkPerformanceMetric setNptkitFrameworkVersion:](self, "setNptkitFrameworkVersion:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 122))
  {
    -[AWDNetworkPerformanceMetric setPerformanceTestStartTime:](self, "setPerformanceTestStartTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 123))
  {
    -[AWDNetworkPerformanceMetric setPingAddress:](self, "setPingAddress:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 127))
  {
    -[AWDNetworkPerformanceMetric setPingLossPercent:](self, "setPingLossPercent:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 128))
  {
    -[AWDNetworkPerformanceMetric setPingMaxLatency:](self, "setPingMaxLatency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 129))
  {
    -[AWDNetworkPerformanceMetric setPingMeanLatency:](self, "setPingMeanLatency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 130))
  {
    -[AWDNetworkPerformanceMetric setPingMinLatency:](self, "setPingMinLatency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 131))
  {
    -[AWDNetworkPerformanceMetric setPingStandardDeviation:](self, "setPingStandardDeviation:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 132))
  {
    -[AWDNetworkPerformanceMetric setPowerBatteryWarningLevel:](self, "setPowerBatteryWarningLevel:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 133))
  {
    -[AWDNetworkPerformanceMetric setPowerSourceType:](self, "setPowerSourceType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 134))
  {
    -[AWDNetworkPerformanceMetric setPowerStateCaps:](self, "setPowerStateCaps:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 135))
  {
    -[AWDNetworkPerformanceMetric setSystemActiveProcessorCount:](self, "setSystemActiveProcessorCount:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 136))
  {
    -[AWDNetworkPerformanceMetric setSystemBatteryLevel:](self, "setSystemBatteryLevel:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 137))
  {
    -[AWDNetworkPerformanceMetric setSystemBatteryState:](self, "setSystemBatteryState:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 138))
  {
    -[AWDNetworkPerformanceMetric setSystemDeviceClass:](self, "setSystemDeviceClass:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 139))
  {
    -[AWDNetworkPerformanceMetric setSystemDeviceModel:](self, "setSystemDeviceModel:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1686) & 1) != 0)
  {
    self->_systemLowPowerModeEnabled = *((_BYTE *)v4 + 1671);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((_QWORD *)v4 + 140))
  {
    -[AWDNetworkPerformanceMetric setSystemName:](self, "setSystemName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 141))
  {
    -[AWDNetworkPerformanceMetric setSystemOsVariant:](self, "setSystemOsVariant:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 142))
  {
    -[AWDNetworkPerformanceMetric setSystemPhysicalMemory:](self, "setSystemPhysicalMemory:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1686) & 2) != 0)
  {
    self->_systemPowersourceConnected = *((_BYTE *)v4 + 1672);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((_QWORD *)v4 + 143))
  {
    -[AWDNetworkPerformanceMetric setSystemProcessorCount:](self, "setSystemProcessorCount:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 144))
  {
    -[AWDNetworkPerformanceMetric setSystemVersion:](self, "setSystemVersion:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 145))
  {
    -[AWDNetworkPerformanceMetric setUploadCdnPop:](self, "setUploadCdnPop:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 146))
  {
    -[AWDNetworkPerformanceMetric setUploadCdnUuid:](self, "setUploadCdnUuid:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 147))
  {
    -[AWDNetworkPerformanceMetric setUploadConnectionTime:](self, "setUploadConnectionTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 148))
  {
    -[AWDNetworkPerformanceMetric setUploadDomainLookupTime:](self, "setUploadDomainLookupTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 150))
  {
    -[AWDNetworkPerformanceMetric setUploadEndDataBearerTechnology:](self, "setUploadEndDataBearerTechnology:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 151))
  {
    -[AWDNetworkPerformanceMetric setUploadEndPrimaryIpv4Interface:](self, "setUploadEndPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 153))
  {
    -[AWDNetworkPerformanceMetric setUploadEndRat:](self, "setUploadEndRat:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 157))
  {
    -[AWDNetworkPerformanceMetric setUploadFileSize:](self, "setUploadFileSize:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 158))
  {
    -[AWDNetworkPerformanceMetric setUploadInterfaceName:](self, "setUploadInterfaceName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 159))
  {
    -[AWDNetworkPerformanceMetric setUploadInterfaceServiceName:](self, "setUploadInterfaceServiceName:");
    v4 = v8;
  }
  v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x40000) != 0)
  {
    self->_uploadIsCellular = *((_BYTE *)v4 + 1673);
    *(_DWORD *)&self->_has |= 0x40000u;
    v7 = *((_DWORD *)v4 + 421);
    if ((v7 & 0x80000) == 0)
    {
LABEL_247:
      if ((v7 & 0x100000) == 0)
        goto LABEL_248;
      goto LABEL_463;
    }
  }
  else if ((v7 & 0x80000) == 0)
  {
    goto LABEL_247;
  }
  self->_uploadIsConstrained = *((_BYTE *)v4 + 1674);
  *(_DWORD *)&self->_has |= 0x80000u;
  v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x100000) == 0)
  {
LABEL_248:
    if ((v7 & 0x200000) == 0)
      goto LABEL_249;
    goto LABEL_464;
  }
LABEL_463:
  self->_uploadIsExpensive = *((_BYTE *)v4 + 1675);
  *(_DWORD *)&self->_has |= 0x100000u;
  v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x200000) == 0)
  {
LABEL_249:
    if ((v7 & 0x400000) == 0)
      goto LABEL_250;
    goto LABEL_465;
  }
LABEL_464:
  self->_uploadIsMultipath = *((_BYTE *)v4 + 1676);
  *(_DWORD *)&self->_has |= 0x200000u;
  v7 = *((_DWORD *)v4 + 421);
  if ((v7 & 0x400000) == 0)
  {
LABEL_250:
    if ((v7 & 0x800000) == 0)
      goto LABEL_252;
    goto LABEL_251;
  }
LABEL_465:
  self->_uploadIsProxyConnection = *((_BYTE *)v4 + 1677);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v4 + 421) & 0x800000) != 0)
  {
LABEL_251:
    self->_uploadIsReusedConnection = *((_BYTE *)v4 + 1678);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
LABEL_252:
  if (*((_QWORD *)v4 + 161))
  {
    -[AWDNetworkPerformanceMetric setUploadMaxSpeedObserved:](self, "setUploadMaxSpeedObserved:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 162))
  {
    -[AWDNetworkPerformanceMetric setUploadNumberOfStreams:](self, "setUploadNumberOfStreams:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 163))
  {
    -[AWDNetworkPerformanceMetric setUploadProtocolName:](self, "setUploadProtocolName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 164))
  {
    -[AWDNetworkPerformanceMetric setUploadRemoteAddress:](self, "setUploadRemoteAddress:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 165))
  {
    -[AWDNetworkPerformanceMetric setUploadRemotePort:](self, "setUploadRemotePort:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 166))
  {
    -[AWDNetworkPerformanceMetric setUploadRequestTime:](self, "setUploadRequestTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 167))
  {
    -[AWDNetworkPerformanceMetric setUploadRequestToResponseTime:](self, "setUploadRequestToResponseTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 168))
  {
    -[AWDNetworkPerformanceMetric setUploadResponseTime:](self, "setUploadResponseTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 172))
  {
    -[AWDNetworkPerformanceMetric setUploadSecureConnectionTime:](self, "setUploadSecureConnectionTime:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 173))
  {
    -[AWDNetworkPerformanceMetric setUploadServer:](self, "setUploadServer:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 174))
  {
    -[AWDNetworkPerformanceMetric setUploadSpeed:](self, "setUploadSpeed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 177))
  {
    -[AWDNetworkPerformanceMetric setUploadStableSpeed:](self, "setUploadStableSpeed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 179))
  {
    -[AWDNetworkPerformanceMetric setUploadStartDataBearerTechnology:](self, "setUploadStartDataBearerTechnology:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 180))
  {
    -[AWDNetworkPerformanceMetric setUploadStartPrimaryIpv4Interface:](self, "setUploadStartPrimaryIpv4Interface:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 182))
  {
    -[AWDNetworkPerformanceMetric setUploadStartRat:](self, "setUploadStartRat:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1687) & 1) != 0)
  {
    self->_useWifiWasSpecified = *((_BYTE *)v4 + 1679);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (*((_QWORD *)v4 + 184))
  {
    -[AWDNetworkPerformanceMetric setWifiAveragePhyRateRx:](self, "setWifiAveragePhyRateRx:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 185))
  {
    -[AWDNetworkPerformanceMetric setWifiAverageRssi:](self, "setWifiAverageRssi:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 186))
  {
    -[AWDNetworkPerformanceMetric setWifiAverageSnr:](self, "setWifiAverageSnr:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 187))
  {
    -[AWDNetworkPerformanceMetric setWifiAverageTcpRtt:](self, "setWifiAverageTcpRtt:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 188))
  {
    -[AWDNetworkPerformanceMetric setWifiBtcMode:](self, "setWifiBtcMode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 189))
  {
    -[AWDNetworkPerformanceMetric setWifiCca:](self, "setWifiCca:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 190))
  {
    -[AWDNetworkPerformanceMetric setWifiChannel:](self, "setWifiChannel:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 193))
  {
    -[AWDNetworkPerformanceMetric setWifiCwfCca:](self, "setWifiCwfCca:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 194))
  {
    -[AWDNetworkPerformanceMetric setWifiEapolControlMode:](self, "setWifiEapolControlMode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 195))
  {
    -[AWDNetworkPerformanceMetric setWifiEapolSupplicantState:](self, "setWifiEapolSupplicantState:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 196))
  {
    -[AWDNetworkPerformanceMetric setWifiGuardInterval:](self, "setWifiGuardInterval:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 197))
  {
    -[AWDNetworkPerformanceMetric setWifiHiddenState:](self, "setWifiHiddenState:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1687) & 2) != 0)
  {
    self->_wifiIsCaptive = *((_BYTE *)v4 + 1680);
    *(_DWORD *)&self->_has |= 0x2000000u;
  }
  if (*((_QWORD *)v4 + 198))
  {
    -[AWDNetworkPerformanceMetric setWifiMcsIndex:](self, "setWifiMcsIndex:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 199))
  {
    -[AWDNetworkPerformanceMetric setWifiNoise:](self, "setWifiNoise:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 200))
  {
    -[AWDNetworkPerformanceMetric setWifiNumberOfSpatialStreams:](self, "setWifiNumberOfSpatialStreams:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 201))
  {
    -[AWDNetworkPerformanceMetric setWifiOpMode:](self, "setWifiOpMode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 202))
  {
    -[AWDNetworkPerformanceMetric setWifiPhyMode:](self, "setWifiPhyMode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 203))
  {
    -[AWDNetworkPerformanceMetric setWifiRssi:](self, "setWifiRssi:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 204))
  {
    -[AWDNetworkPerformanceMetric setWifiSecurity:](self, "setWifiSecurity:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 205))
  {
    -[AWDNetworkPerformanceMetric setWifiTxRate:](self, "setWifiTxRate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 206))
  {
    -[AWDNetworkPerformanceMetric setWrmChannelType:](self, "setWrmChannelType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[AWDNetworkPerformanceMetric setCellularCellid:](self, "setCellularCellid:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1684) & 2) != 0)
  {
    self->_acceptablePerformanceResult = *((_BYTE *)v4 + 1656);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 119))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityResponsiveness:](self, "setNetworkQualityResponsiveness:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[AWDNetworkPerformanceMetric setCellularAggregatedDLBW:](self, "setCellularAggregatedDLBW:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[AWDNetworkPerformanceMetric setCellularAggregatedULBW:](self, "setCellularAggregatedULBW:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 27))
  {
    -[AWDNetworkPerformanceMetric setCellularIssa:](self, "setCellularIssa:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 28))
  {
    -[AWDNetworkPerformanceMetric setCellularLac:](self, "setCellularLac:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 31))
  {
    -[AWDNetworkPerformanceMetric setCellularLteNrConfiguredBw:](self, "setCellularLteNrConfiguredBw:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 32))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxDlMod:](self, "setCellularMaxDlMod:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 33))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxNwMimoLyr:](self, "setCellularMaxNwMimoLyr:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 34))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxSchdMimoLyr:](self, "setCellularMaxSchdMimoLyr:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 35))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxUeRank:](self, "setCellularMaxUeRank:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 36))
  {
    -[AWDNetworkPerformanceMetric setCellularMaxUlMod:](self, "setCellularMaxUlMod:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 52))
  {
    -[AWDNetworkPerformanceMetric setCellularNrSinr:](self, "setCellularNrSinr:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 54))
  {
    -[AWDNetworkPerformanceMetric setCellularNrarfcn:](self, "setCellularNrarfcn:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 58))
  {
    -[AWDNetworkPerformanceMetric setCellularRadioFrequency:](self, "setCellularRadioFrequency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 68))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalDlMimoLayers:](self, "setCellularTotalDlMimoLayers:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 70))
  {
    -[AWDNetworkPerformanceMetric setCellularTotalNumCcs:](self, "setCellularTotalNumCcs:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 108))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartRadioFrequency:](self, "setDownloadStartRadioFrequency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 79))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndRadioFrequency:](self, "setDownloadEndRadioFrequency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 112))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv6InterfaceName:](self, "setNetworkPrimaryIpv6InterfaceName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 113))
  {
    -[AWDNetworkPerformanceMetric setNetworkPrimaryIpv6ServiceName:](self, "setNetworkPrimaryIpv6ServiceName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 181))
  {
    -[AWDNetworkPerformanceMetric setUploadStartRadioFrequency:](self, "setUploadStartRadioFrequency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 152))
  {
    -[AWDNetworkPerformanceMetric setUploadEndRadioFrequency:](self, "setUploadEndRadioFrequency:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 81))
  {
    -[AWDNetworkPerformanceMetric setDownloadError:](self, "setDownloadError:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 115))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityError:](self, "setNetworkQualityError:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 114))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityDownloadSpeed:](self, "setNetworkQualityDownloadSpeed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 120))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityUploadSpeed:](self, "setNetworkQualityUploadSpeed:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 118))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityRating:](self, "setNetworkQualityRating:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 183))
  {
    -[AWDNetworkPerformanceMetric setVpnConnectionState:](self, "setVpnConnectionState:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 154))
  {
    -[AWDNetworkPerformanceMetric setUploadError:](self, "setUploadError:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 156))
  {
    -[AWDNetworkPerformanceMetric setUploadErrorDomain:](self, "setUploadErrorDomain:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 155))
  {
    -[AWDNetworkPerformanceMetric setUploadErrorCode:](self, "setUploadErrorCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 83))
  {
    -[AWDNetworkPerformanceMetric setDownloadErrorDomain:](self, "setDownloadErrorDomain:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 82))
  {
    -[AWDNetworkPerformanceMetric setDownloadErrorCode:](self, "setDownloadErrorCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 124))
  {
    -[AWDNetworkPerformanceMetric setPingError:](self, "setPingError:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 126))
  {
    -[AWDNetworkPerformanceMetric setPingErrorDomain:](self, "setPingErrorDomain:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 125))
  {
    -[AWDNetworkPerformanceMetric setPingErrorCode:](self, "setPingErrorCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 117))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityErrorDomain:](self, "setNetworkQualityErrorDomain:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 116))
  {
    -[AWDNetworkPerformanceMetric setNetworkQualityErrorCode:](self, "setNetworkQualityErrorCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 59))
  {
    -[AWDNetworkPerformanceMetric setCellularRnMobileCountryCode:](self, "setCellularRnMobileCountryCode:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 60))
  {
    -[AWDNetworkPerformanceMetric setCellularRnMobileNetworkCode:](self, "setCellularRnMobileNetworkCode:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 1685) & 1) != 0)
  {
    self->_cellularDataIsEnabled = *((_BYTE *)v4 + 1663);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 105))
  {
    -[AWDNetworkPerformanceMetric setDownloadStartCellularEstimate:](self, "setDownloadStartCellularEstimate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 76))
  {
    -[AWDNetworkPerformanceMetric setDownloadEndCellularEstimate:](self, "setDownloadEndCellularEstimate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 87))
  {
    -[AWDNetworkPerformanceMetric setDownloadMaxCellularEstimate:](self, "setDownloadMaxCellularEstimate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 178))
  {
    -[AWDNetworkPerformanceMetric setUploadStartCellularEstimate:](self, "setUploadStartCellularEstimate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 149))
  {
    -[AWDNetworkPerformanceMetric setUploadEndCellularEstimate:](self, "setUploadEndCellularEstimate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 160))
  {
    -[AWDNetworkPerformanceMetric setUploadMaxCellularEstimate:](self, "setUploadMaxCellularEstimate:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 96))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponsiveness:](self, "setDownloadResponsiveness:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 97))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponsivenessConfidence:](self, "setDownloadResponsivenessConfidence:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 98))
  {
    -[AWDNetworkPerformanceMetric setDownloadResponsivenessRating:](self, "setDownloadResponsivenessRating:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 102))
  {
    -[AWDNetworkPerformanceMetric setDownloadSpeedConfidence:](self, "setDownloadSpeedConfidence:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 103))
  {
    -[AWDNetworkPerformanceMetric setDownloadSpeedRating:](self, "setDownloadSpeedRating:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 169))
  {
    -[AWDNetworkPerformanceMetric setUploadResponsiveness:](self, "setUploadResponsiveness:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 170))
  {
    -[AWDNetworkPerformanceMetric setUploadResponsivenessConfidence:](self, "setUploadResponsivenessConfidence:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 171))
  {
    -[AWDNetworkPerformanceMetric setUploadResponsivenessRating:](self, "setUploadResponsivenessRating:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 175))
  {
    -[AWDNetworkPerformanceMetric setUploadSpeedConfidence:](self, "setUploadSpeedConfidence:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 176))
  {
    -[AWDNetworkPerformanceMetric setUploadSpeedRating:](self, "setUploadSpeedRating:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 191))
  {
    -[AWDNetworkPerformanceMetric setWifiChannelBand:](self, "setWifiChannelBand:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 192))
  {
    -[AWDNetworkPerformanceMetric setWifiChannelWidth:](self, "setWifiChannelWidth:");
    v4 = v8;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)acceptablePerformanceResult
{
  return self->_acceptablePerformanceResult;
}

- (NSString)awdlElectionParameters
{
  return self->_awdlElectionParameters;
}

- (void)setAwdlElectionParameters:(id)a3
{
  objc_storeStrong((id *)&self->_awdlElectionParameters, a3);
}

- (NSString)awdlMasterChannel
{
  return self->_awdlMasterChannel;
}

- (void)setAwdlMasterChannel:(id)a3
{
  objc_storeStrong((id *)&self->_awdlMasterChannel, a3);
}

- (NSString)awdlOpMode
{
  return self->_awdlOpMode;
}

- (void)setAwdlOpMode:(id)a3
{
  objc_storeStrong((id *)&self->_awdlOpMode, a3);
}

- (BOOL)awdlPowerState
{
  return self->_awdlPowerState;
}

- (NSString)awdlSchedule
{
  return self->_awdlSchedule;
}

- (void)setAwdlSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_awdlSchedule, a3);
}

- (NSString)awdlSecondaryMasterChannel
{
  return self->_awdlSecondaryMasterChannel;
}

- (void)setAwdlSecondaryMasterChannel:(id)a3
{
  objc_storeStrong((id *)&self->_awdlSecondaryMasterChannel, a3);
}

- (NSString)awdlSyncChannelSequence
{
  return self->_awdlSyncChannelSequence;
}

- (void)setAwdlSyncChannelSequence:(id)a3
{
  objc_storeStrong((id *)&self->_awdlSyncChannelSequence, a3);
}

- (NSString)awdlSyncState
{
  return self->_awdlSyncState;
}

- (void)setAwdlSyncState:(id)a3
{
  objc_storeStrong((id *)&self->_awdlSyncState, a3);
}

- (NSString)btConnectedDevicesCount
{
  return self->_btConnectedDevicesCount;
}

- (void)setBtConnectedDevicesCount:(id)a3
{
  objc_storeStrong((id *)&self->_btConnectedDevicesCount, a3);
}

- (BOOL)btIsConnectable
{
  return self->_btIsConnectable;
}

- (BOOL)btIsDiscoverable
{
  return self->_btIsDiscoverable;
}

- (BOOL)btIsPowerOn
{
  return self->_btIsPowerOn;
}

- (BOOL)btIsScanning
{
  return self->_btIsScanning;
}

- (NSString)callingClient
{
  return self->_callingClient;
}

- (void)setCallingClient:(id)a3
{
  objc_storeStrong((id *)&self->_callingClient, a3);
}

- (NSString)cellularActiveContexts
{
  return self->_cellularActiveContexts;
}

- (void)setCellularActiveContexts:(id)a3
{
  objc_storeStrong((id *)&self->_cellularActiveContexts, a3);
}

- (BOOL)cellularAllowsVoip
{
  return self->_cellularAllowsVoip;
}

- (NSString)cellularAttached
{
  return self->_cellularAttached;
}

- (void)setCellularAttached:(id)a3
{
  objc_storeStrong((id *)&self->_cellularAttached, a3);
}

- (NSString)cellularBandinfo
{
  return self->_cellularBandinfo;
}

- (void)setCellularBandinfo:(id)a3
{
  objc_storeStrong((id *)&self->_cellularBandinfo, a3);
}

- (NSString)cellularBandwidth
{
  return self->_cellularBandwidth;
}

- (void)setCellularBandwidth:(id)a3
{
  objc_storeStrong((id *)&self->_cellularBandwidth, a3);
}

- (NSString)cellularCarrierName
{
  return self->_cellularCarrierName;
}

- (void)setCellularCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_cellularCarrierName, a3);
}

- (NSString)cellularDataBearerSoMask
{
  return self->_cellularDataBearerSoMask;
}

- (void)setCellularDataBearerSoMask:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataBearerSoMask, a3);
}

- (NSString)cellularDataBearerTechnology
{
  return self->_cellularDataBearerTechnology;
}

- (void)setCellularDataBearerTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataBearerTechnology, a3);
}

- (NSString)cellularDataPlanSignalingReductionOverride
{
  return self->_cellularDataPlanSignalingReductionOverride;
}

- (void)setCellularDataPlanSignalingReductionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataPlanSignalingReductionOverride, a3);
}

- (NSString)cellularDataPossible
{
  return self->_cellularDataPossible;
}

- (void)setCellularDataPossible:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataPossible, a3);
}

- (NSString)cellularInHomeCountry
{
  return self->_cellularInHomeCountry;
}

- (void)setCellularInHomeCountry:(id)a3
{
  objc_storeStrong((id *)&self->_cellularInHomeCountry, a3);
}

- (NSString)cellularIndicator
{
  return self->_cellularIndicator;
}

- (void)setCellularIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_cellularIndicator, a3);
}

- (NSString)cellularIndicatorOverride
{
  return self->_cellularIndicatorOverride;
}

- (void)setCellularIndicatorOverride:(id)a3
{
  objc_storeStrong((id *)&self->_cellularIndicatorOverride, a3);
}

- (NSString)cellularIsoCountryCode
{
  return self->_cellularIsoCountryCode;
}

- (void)setCellularIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_cellularIsoCountryCode, a3);
}

- (NSString)cellularLqm
{
  return self->_cellularLqm;
}

- (void)setCellularLqm:(id)a3
{
  objc_storeStrong((id *)&self->_cellularLqm, a3);
}

- (NSString)cellularLteMaxScheduledLayers
{
  return self->_cellularLteMaxScheduledLayers;
}

- (void)setCellularLteMaxScheduledLayers:(id)a3
{
  objc_storeStrong((id *)&self->_cellularLteMaxScheduledLayers, a3);
}

- (NSString)cellularMobileCountryCode
{
  return self->_cellularMobileCountryCode;
}

- (void)setCellularMobileCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMobileCountryCode, a3);
}

- (NSString)cellularMobileNetworkCode
{
  return self->_cellularMobileNetworkCode;
}

- (void)setCellularMobileNetworkCode:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMobileNetworkCode, a3);
}

- (NSString)cellularNewRadioCoverage
{
  return self->_cellularNewRadioCoverage;
}

- (void)setCellularNewRadioCoverage:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioCoverage, a3);
}

- (NSString)cellularNewRadioDataBearer
{
  return self->_cellularNewRadioDataBearer;
}

- (void)setCellularNewRadioDataBearer:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioDataBearer, a3);
}

- (NSString)cellularNewRadioMmwaveDataBearer
{
  return self->_cellularNewRadioMmwaveDataBearer;
}

- (void)setCellularNewRadioMmwaveDataBearer:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioMmwaveDataBearer, a3);
}

- (NSString)cellularNewRadioNsaCoverage
{
  return self->_cellularNewRadioNsaCoverage;
}

- (void)setCellularNewRadioNsaCoverage:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioNsaCoverage, a3);
}

- (NSString)cellularNewRadioNsaDataBearer
{
  return self->_cellularNewRadioNsaDataBearer;
}

- (void)setCellularNewRadioNsaDataBearer:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioNsaDataBearer, a3);
}

- (NSString)cellularNewRadioSaCoverage
{
  return self->_cellularNewRadioSaCoverage;
}

- (void)setCellularNewRadioSaCoverage:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioSaCoverage, a3);
}

- (NSString)cellularNewRadioSaDataBearer
{
  return self->_cellularNewRadioSaDataBearer;
}

- (void)setCellularNewRadioSaDataBearer:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioSaDataBearer, a3);
}

- (NSString)cellularNewRadioSub6DataBearer
{
  return self->_cellularNewRadioSub6DataBearer;
}

- (void)setCellularNewRadioSub6DataBearer:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNewRadioSub6DataBearer, a3);
}

- (NSString)cellularNrConfiguredBw
{
  return self->_cellularNrConfiguredBw;
}

- (void)setCellularNrConfiguredBw:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrConfiguredBw, a3);
}

- (NSString)cellularNrLayers
{
  return self->_cellularNrLayers;
}

- (void)setCellularNrLayers:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrLayers, a3);
}

- (NSString)cellularNrModulation
{
  return self->_cellularNrModulation;
}

- (void)setCellularNrModulation:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrModulation, a3);
}

- (NSString)cellularNrRsrp
{
  return self->_cellularNrRsrp;
}

- (void)setCellularNrRsrp:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrRsrp, a3);
}

- (NSString)cellularNrRsrq
{
  return self->_cellularNrRsrq;
}

- (void)setCellularNrRsrq:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrRsrq, a3);
}

- (NSString)cellularNrSnr
{
  return self->_cellularNrSnr;
}

- (void)setCellularNrSnr:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrSnr, a3);
}

- (NSString)cellularPid
{
  return self->_cellularPid;
}

- (void)setCellularPid:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPid, a3);
}

- (NSString)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (void)setCellularRadioAccessTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnology, a3);
}

- (NSString)cellularRadioAccessTechnologyCtDataStatus
{
  return self->_cellularRadioAccessTechnologyCtDataStatus;
}

- (void)setCellularRadioAccessTechnologyCtDataStatus:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnologyCtDataStatus, a3);
}

- (NSString)cellularRoamAllowed
{
  return self->_cellularRoamAllowed;
}

- (void)setCellularRoamAllowed:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRoamAllowed, a3);
}

- (NSString)cellularRsrp
{
  return self->_cellularRsrp;
}

- (void)setCellularRsrp:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRsrp, a3);
}

- (NSString)cellularSnr
{
  return self->_cellularSnr;
}

- (void)setCellularSnr:(id)a3
{
  objc_storeStrong((id *)&self->_cellularSnr, a3);
}

- (NSString)cellularTac
{
  return self->_cellularTac;
}

- (void)setCellularTac:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTac, a3);
}

- (NSString)cellularTotalActiveContexts
{
  return self->_cellularTotalActiveContexts;
}

- (void)setCellularTotalActiveContexts:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTotalActiveContexts, a3);
}

- (NSString)cellularTotalBw
{
  return self->_cellularTotalBw;
}

- (void)setCellularTotalBw:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTotalBw, a3);
}

- (NSString)cellularTotalCcs
{
  return self->_cellularTotalCcs;
}

- (void)setCellularTotalCcs:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTotalCcs, a3);
}

- (NSString)cellularTotalLayers
{
  return self->_cellularTotalLayers;
}

- (void)setCellularTotalLayers:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTotalLayers, a3);
}

- (NSString)cellularUarfcn
{
  return self->_cellularUarfcn;
}

- (void)setCellularUarfcn:(id)a3
{
  objc_storeStrong((id *)&self->_cellularUarfcn, a3);
}

- (NSString)downloadCdnPop
{
  return self->_downloadCdnPop;
}

- (void)setDownloadCdnPop:(id)a3
{
  objc_storeStrong((id *)&self->_downloadCdnPop, a3);
}

- (NSString)downloadCdnUuid
{
  return self->_downloadCdnUuid;
}

- (void)setDownloadCdnUuid:(id)a3
{
  objc_storeStrong((id *)&self->_downloadCdnUuid, a3);
}

- (NSString)downloadConnectionTime
{
  return self->_downloadConnectionTime;
}

- (void)setDownloadConnectionTime:(id)a3
{
  objc_storeStrong((id *)&self->_downloadConnectionTime, a3);
}

- (NSString)downloadDomainLookupTime
{
  return self->_downloadDomainLookupTime;
}

- (void)setDownloadDomainLookupTime:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDomainLookupTime, a3);
}

- (NSString)downloadEndDataBearerTechnology
{
  return self->_downloadEndDataBearerTechnology;
}

- (void)setDownloadEndDataBearerTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEndDataBearerTechnology, a3);
}

- (NSString)downloadEndPrimaryIpv4Interface
{
  return self->_downloadEndPrimaryIpv4Interface;
}

- (void)setDownloadEndPrimaryIpv4Interface:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEndPrimaryIpv4Interface, a3);
}

- (NSString)downloadEndRat
{
  return self->_downloadEndRat;
}

- (void)setDownloadEndRat:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEndRat, a3);
}

- (NSString)downloadFileSize
{
  return self->_downloadFileSize;
}

- (void)setDownloadFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_downloadFileSize, a3);
}

- (NSString)downloadInterfaceName
{
  return self->_downloadInterfaceName;
}

- (void)setDownloadInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_downloadInterfaceName, a3);
}

- (NSString)downloadInterfaceServiceName
{
  return self->_downloadInterfaceServiceName;
}

- (void)setDownloadInterfaceServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_downloadInterfaceServiceName, a3);
}

- (BOOL)downloadIsCellular
{
  return self->_downloadIsCellular;
}

- (BOOL)downloadIsConstrained
{
  return self->_downloadIsConstrained;
}

- (BOOL)downloadIsExpensive
{
  return self->_downloadIsExpensive;
}

- (BOOL)downloadIsMultipath
{
  return self->_downloadIsMultipath;
}

- (BOOL)downloadIsProxyConnection
{
  return self->_downloadIsProxyConnection;
}

- (BOOL)downloadIsReusedConnection
{
  return self->_downloadIsReusedConnection;
}

- (NSString)downloadMaxSpeedObserved
{
  return self->_downloadMaxSpeedObserved;
}

- (void)setDownloadMaxSpeedObserved:(id)a3
{
  objc_storeStrong((id *)&self->_downloadMaxSpeedObserved, a3);
}

- (NSString)downloadNumberOfStreams
{
  return self->_downloadNumberOfStreams;
}

- (void)setDownloadNumberOfStreams:(id)a3
{
  objc_storeStrong((id *)&self->_downloadNumberOfStreams, a3);
}

- (NSString)downloadProtocolName
{
  return self->_downloadProtocolName;
}

- (void)setDownloadProtocolName:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProtocolName, a3);
}

- (NSString)downloadRemoteAddress
{
  return self->_downloadRemoteAddress;
}

- (void)setDownloadRemoteAddress:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRemoteAddress, a3);
}

- (NSString)downloadRemotePort
{
  return self->_downloadRemotePort;
}

- (void)setDownloadRemotePort:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRemotePort, a3);
}

- (NSString)downloadRequestTime
{
  return self->_downloadRequestTime;
}

- (void)setDownloadRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRequestTime, a3);
}

- (NSString)downloadRequestToResponseTime
{
  return self->_downloadRequestToResponseTime;
}

- (void)setDownloadRequestToResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRequestToResponseTime, a3);
}

- (NSString)downloadResponseTime
{
  return self->_downloadResponseTime;
}

- (void)setDownloadResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_downloadResponseTime, a3);
}

- (NSString)downloadSecureConnectionTime
{
  return self->_downloadSecureConnectionTime;
}

- (void)setDownloadSecureConnectionTime:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSecureConnectionTime, a3);
}

- (NSString)downloadServer
{
  return self->_downloadServer;
}

- (void)setDownloadServer:(id)a3
{
  objc_storeStrong((id *)&self->_downloadServer, a3);
}

- (NSString)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSpeed, a3);
}

- (NSString)downloadStableSpeed
{
  return self->_downloadStableSpeed;
}

- (void)setDownloadStableSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStableSpeed, a3);
}

- (NSString)downloadStartDataBearerTechnology
{
  return self->_downloadStartDataBearerTechnology;
}

- (void)setDownloadStartDataBearerTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStartDataBearerTechnology, a3);
}

- (NSString)downloadStartPrimaryIpv4Interface
{
  return self->_downloadStartPrimaryIpv4Interface;
}

- (void)setDownloadStartPrimaryIpv4Interface:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStartPrimaryIpv4Interface, a3);
}

- (NSString)downloadStartRat
{
  return self->_downloadStartRat;
}

- (void)setDownloadStartRat:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStartRat, a3);
}

- (BOOL)networkIsAppleReachable
{
  return self->_networkIsAppleReachable;
}

- (NSString)networkPrimaryIpv4InterfaceName
{
  return self->_networkPrimaryIpv4InterfaceName;
}

- (void)setNetworkPrimaryIpv4InterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_networkPrimaryIpv4InterfaceName, a3);
}

- (NSString)networkPrimaryIpv4ServiceName
{
  return self->_networkPrimaryIpv4ServiceName;
}

- (void)setNetworkPrimaryIpv4ServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_networkPrimaryIpv4ServiceName, a3);
}

- (NSString)nptkitFrameworkVersion
{
  return self->_nptkitFrameworkVersion;
}

- (void)setNptkitFrameworkVersion:(id)a3
{
  objc_storeStrong((id *)&self->_nptkitFrameworkVersion, a3);
}

- (NSString)performanceTestStartTime
{
  return self->_performanceTestStartTime;
}

- (void)setPerformanceTestStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_performanceTestStartTime, a3);
}

- (NSString)pingAddress
{
  return self->_pingAddress;
}

- (void)setPingAddress:(id)a3
{
  objc_storeStrong((id *)&self->_pingAddress, a3);
}

- (NSString)pingLossPercent
{
  return self->_pingLossPercent;
}

- (void)setPingLossPercent:(id)a3
{
  objc_storeStrong((id *)&self->_pingLossPercent, a3);
}

- (NSString)pingMaxLatency
{
  return self->_pingMaxLatency;
}

- (void)setPingMaxLatency:(id)a3
{
  objc_storeStrong((id *)&self->_pingMaxLatency, a3);
}

- (NSString)pingMeanLatency
{
  return self->_pingMeanLatency;
}

- (void)setPingMeanLatency:(id)a3
{
  objc_storeStrong((id *)&self->_pingMeanLatency, a3);
}

- (NSString)pingMinLatency
{
  return self->_pingMinLatency;
}

- (void)setPingMinLatency:(id)a3
{
  objc_storeStrong((id *)&self->_pingMinLatency, a3);
}

- (NSString)pingStandardDeviation
{
  return self->_pingStandardDeviation;
}

- (void)setPingStandardDeviation:(id)a3
{
  objc_storeStrong((id *)&self->_pingStandardDeviation, a3);
}

- (NSString)powerBatteryWarningLevel
{
  return self->_powerBatteryWarningLevel;
}

- (void)setPowerBatteryWarningLevel:(id)a3
{
  objc_storeStrong((id *)&self->_powerBatteryWarningLevel, a3);
}

- (NSString)powerSourceType
{
  return self->_powerSourceType;
}

- (void)setPowerSourceType:(id)a3
{
  objc_storeStrong((id *)&self->_powerSourceType, a3);
}

- (NSString)powerStateCaps
{
  return self->_powerStateCaps;
}

- (void)setPowerStateCaps:(id)a3
{
  objc_storeStrong((id *)&self->_powerStateCaps, a3);
}

- (NSString)systemActiveProcessorCount
{
  return self->_systemActiveProcessorCount;
}

- (void)setSystemActiveProcessorCount:(id)a3
{
  objc_storeStrong((id *)&self->_systemActiveProcessorCount, a3);
}

- (NSString)systemBatteryLevel
{
  return self->_systemBatteryLevel;
}

- (void)setSystemBatteryLevel:(id)a3
{
  objc_storeStrong((id *)&self->_systemBatteryLevel, a3);
}

- (NSString)systemBatteryState
{
  return self->_systemBatteryState;
}

- (void)setSystemBatteryState:(id)a3
{
  objc_storeStrong((id *)&self->_systemBatteryState, a3);
}

- (NSString)systemDeviceClass
{
  return self->_systemDeviceClass;
}

- (void)setSystemDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_systemDeviceClass, a3);
}

- (NSString)systemDeviceModel
{
  return self->_systemDeviceModel;
}

- (void)setSystemDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_systemDeviceModel, a3);
}

- (BOOL)systemLowPowerModeEnabled
{
  return self->_systemLowPowerModeEnabled;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
  objc_storeStrong((id *)&self->_systemName, a3);
}

- (NSString)systemOsVariant
{
  return self->_systemOsVariant;
}

- (void)setSystemOsVariant:(id)a3
{
  objc_storeStrong((id *)&self->_systemOsVariant, a3);
}

- (NSString)systemPhysicalMemory
{
  return self->_systemPhysicalMemory;
}

- (void)setSystemPhysicalMemory:(id)a3
{
  objc_storeStrong((id *)&self->_systemPhysicalMemory, a3);
}

- (BOOL)systemPowersourceConnected
{
  return self->_systemPowersourceConnected;
}

- (NSString)systemProcessorCount
{
  return self->_systemProcessorCount;
}

- (void)setSystemProcessorCount:(id)a3
{
  objc_storeStrong((id *)&self->_systemProcessorCount, a3);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_storeStrong((id *)&self->_systemVersion, a3);
}

- (NSString)uploadCdnPop
{
  return self->_uploadCdnPop;
}

- (void)setUploadCdnPop:(id)a3
{
  objc_storeStrong((id *)&self->_uploadCdnPop, a3);
}

- (NSString)uploadCdnUuid
{
  return self->_uploadCdnUuid;
}

- (void)setUploadCdnUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uploadCdnUuid, a3);
}

- (NSString)uploadConnectionTime
{
  return self->_uploadConnectionTime;
}

- (void)setUploadConnectionTime:(id)a3
{
  objc_storeStrong((id *)&self->_uploadConnectionTime, a3);
}

- (NSString)uploadDomainLookupTime
{
  return self->_uploadDomainLookupTime;
}

- (void)setUploadDomainLookupTime:(id)a3
{
  objc_storeStrong((id *)&self->_uploadDomainLookupTime, a3);
}

- (NSString)uploadEndDataBearerTechnology
{
  return self->_uploadEndDataBearerTechnology;
}

- (void)setUploadEndDataBearerTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_uploadEndDataBearerTechnology, a3);
}

- (NSString)uploadEndPrimaryIpv4Interface
{
  return self->_uploadEndPrimaryIpv4Interface;
}

- (void)setUploadEndPrimaryIpv4Interface:(id)a3
{
  objc_storeStrong((id *)&self->_uploadEndPrimaryIpv4Interface, a3);
}

- (NSString)uploadEndRat
{
  return self->_uploadEndRat;
}

- (void)setUploadEndRat:(id)a3
{
  objc_storeStrong((id *)&self->_uploadEndRat, a3);
}

- (NSString)uploadFileSize
{
  return self->_uploadFileSize;
}

- (void)setUploadFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_uploadFileSize, a3);
}

- (NSString)uploadInterfaceName
{
  return self->_uploadInterfaceName;
}

- (void)setUploadInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_uploadInterfaceName, a3);
}

- (NSString)uploadInterfaceServiceName
{
  return self->_uploadInterfaceServiceName;
}

- (void)setUploadInterfaceServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_uploadInterfaceServiceName, a3);
}

- (BOOL)uploadIsCellular
{
  return self->_uploadIsCellular;
}

- (BOOL)uploadIsConstrained
{
  return self->_uploadIsConstrained;
}

- (BOOL)uploadIsExpensive
{
  return self->_uploadIsExpensive;
}

- (BOOL)uploadIsMultipath
{
  return self->_uploadIsMultipath;
}

- (BOOL)uploadIsProxyConnection
{
  return self->_uploadIsProxyConnection;
}

- (BOOL)uploadIsReusedConnection
{
  return self->_uploadIsReusedConnection;
}

- (NSString)uploadMaxSpeedObserved
{
  return self->_uploadMaxSpeedObserved;
}

- (void)setUploadMaxSpeedObserved:(id)a3
{
  objc_storeStrong((id *)&self->_uploadMaxSpeedObserved, a3);
}

- (NSString)uploadNumberOfStreams
{
  return self->_uploadNumberOfStreams;
}

- (void)setUploadNumberOfStreams:(id)a3
{
  objc_storeStrong((id *)&self->_uploadNumberOfStreams, a3);
}

- (NSString)uploadProtocolName
{
  return self->_uploadProtocolName;
}

- (void)setUploadProtocolName:(id)a3
{
  objc_storeStrong((id *)&self->_uploadProtocolName, a3);
}

- (NSString)uploadRemoteAddress
{
  return self->_uploadRemoteAddress;
}

- (void)setUploadRemoteAddress:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRemoteAddress, a3);
}

- (NSString)uploadRemotePort
{
  return self->_uploadRemotePort;
}

- (void)setUploadRemotePort:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRemotePort, a3);
}

- (NSString)uploadRequestTime
{
  return self->_uploadRequestTime;
}

- (void)setUploadRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRequestTime, a3);
}

- (NSString)uploadRequestToResponseTime
{
  return self->_uploadRequestToResponseTime;
}

- (void)setUploadRequestToResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRequestToResponseTime, a3);
}

- (NSString)uploadResponseTime
{
  return self->_uploadResponseTime;
}

- (void)setUploadResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_uploadResponseTime, a3);
}

- (NSString)uploadSecureConnectionTime
{
  return self->_uploadSecureConnectionTime;
}

- (void)setUploadSecureConnectionTime:(id)a3
{
  objc_storeStrong((id *)&self->_uploadSecureConnectionTime, a3);
}

- (NSString)uploadServer
{
  return self->_uploadServer;
}

- (void)setUploadServer:(id)a3
{
  objc_storeStrong((id *)&self->_uploadServer, a3);
}

- (NSString)uploadSpeed
{
  return self->_uploadSpeed;
}

- (void)setUploadSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_uploadSpeed, a3);
}

- (NSString)uploadStableSpeed
{
  return self->_uploadStableSpeed;
}

- (void)setUploadStableSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStableSpeed, a3);
}

- (NSString)uploadStartDataBearerTechnology
{
  return self->_uploadStartDataBearerTechnology;
}

- (void)setUploadStartDataBearerTechnology:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStartDataBearerTechnology, a3);
}

- (NSString)uploadStartPrimaryIpv4Interface
{
  return self->_uploadStartPrimaryIpv4Interface;
}

- (void)setUploadStartPrimaryIpv4Interface:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStartPrimaryIpv4Interface, a3);
}

- (NSString)uploadStartRat
{
  return self->_uploadStartRat;
}

- (void)setUploadStartRat:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStartRat, a3);
}

- (BOOL)useWifiWasSpecified
{
  return self->_useWifiWasSpecified;
}

- (NSString)wifiAveragePhyRateRx
{
  return self->_wifiAveragePhyRateRx;
}

- (void)setWifiAveragePhyRateRx:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAveragePhyRateRx, a3);
}

- (NSString)wifiAverageRssi
{
  return self->_wifiAverageRssi;
}

- (void)setWifiAverageRssi:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAverageRssi, a3);
}

- (NSString)wifiAverageSnr
{
  return self->_wifiAverageSnr;
}

- (void)setWifiAverageSnr:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAverageSnr, a3);
}

- (NSString)wifiAverageTcpRtt
{
  return self->_wifiAverageTcpRtt;
}

- (void)setWifiAverageTcpRtt:(id)a3
{
  objc_storeStrong((id *)&self->_wifiAverageTcpRtt, a3);
}

- (NSString)wifiBtcMode
{
  return self->_wifiBtcMode;
}

- (void)setWifiBtcMode:(id)a3
{
  objc_storeStrong((id *)&self->_wifiBtcMode, a3);
}

- (NSString)wifiCca
{
  return self->_wifiCca;
}

- (void)setWifiCca:(id)a3
{
  objc_storeStrong((id *)&self->_wifiCca, a3);
}

- (NSString)wifiChannel
{
  return self->_wifiChannel;
}

- (void)setWifiChannel:(id)a3
{
  objc_storeStrong((id *)&self->_wifiChannel, a3);
}

- (NSString)wifiCwfCca
{
  return self->_wifiCwfCca;
}

- (void)setWifiCwfCca:(id)a3
{
  objc_storeStrong((id *)&self->_wifiCwfCca, a3);
}

- (NSString)wifiEapolControlMode
{
  return self->_wifiEapolControlMode;
}

- (void)setWifiEapolControlMode:(id)a3
{
  objc_storeStrong((id *)&self->_wifiEapolControlMode, a3);
}

- (NSString)wifiEapolSupplicantState
{
  return self->_wifiEapolSupplicantState;
}

- (void)setWifiEapolSupplicantState:(id)a3
{
  objc_storeStrong((id *)&self->_wifiEapolSupplicantState, a3);
}

- (NSString)wifiGuardInterval
{
  return self->_wifiGuardInterval;
}

- (void)setWifiGuardInterval:(id)a3
{
  objc_storeStrong((id *)&self->_wifiGuardInterval, a3);
}

- (NSString)wifiHiddenState
{
  return self->_wifiHiddenState;
}

- (void)setWifiHiddenState:(id)a3
{
  objc_storeStrong((id *)&self->_wifiHiddenState, a3);
}

- (BOOL)wifiIsCaptive
{
  return self->_wifiIsCaptive;
}

- (NSString)wifiMcsIndex
{
  return self->_wifiMcsIndex;
}

- (void)setWifiMcsIndex:(id)a3
{
  objc_storeStrong((id *)&self->_wifiMcsIndex, a3);
}

- (NSString)wifiNoise
{
  return self->_wifiNoise;
}

- (void)setWifiNoise:(id)a3
{
  objc_storeStrong((id *)&self->_wifiNoise, a3);
}

- (NSString)wifiNumberOfSpatialStreams
{
  return self->_wifiNumberOfSpatialStreams;
}

- (void)setWifiNumberOfSpatialStreams:(id)a3
{
  objc_storeStrong((id *)&self->_wifiNumberOfSpatialStreams, a3);
}

- (NSString)wifiOpMode
{
  return self->_wifiOpMode;
}

- (void)setWifiOpMode:(id)a3
{
  objc_storeStrong((id *)&self->_wifiOpMode, a3);
}

- (NSString)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(id)a3
{
  objc_storeStrong((id *)&self->_wifiPhyMode, a3);
}

- (NSString)wifiRssi
{
  return self->_wifiRssi;
}

- (void)setWifiRssi:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRssi, a3);
}

- (NSString)wifiSecurity
{
  return self->_wifiSecurity;
}

- (void)setWifiSecurity:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSecurity, a3);
}

- (NSString)wifiTxRate
{
  return self->_wifiTxRate;
}

- (void)setWifiTxRate:(id)a3
{
  objc_storeStrong((id *)&self->_wifiTxRate, a3);
}

- (NSString)wrmChannelType
{
  return self->_wrmChannelType;
}

- (void)setWrmChannelType:(id)a3
{
  objc_storeStrong((id *)&self->_wrmChannelType, a3);
}

- (NSString)cellularCellid
{
  return self->_cellularCellid;
}

- (void)setCellularCellid:(id)a3
{
  objc_storeStrong((id *)&self->_cellularCellid, a3);
}

- (NSString)networkQualityResponsiveness
{
  return self->_networkQualityResponsiveness;
}

- (void)setNetworkQualityResponsiveness:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityResponsiveness, a3);
}

- (NSString)cellularAggregatedDLBW
{
  return self->_cellularAggregatedDLBW;
}

- (void)setCellularAggregatedDLBW:(id)a3
{
  objc_storeStrong((id *)&self->_cellularAggregatedDLBW, a3);
}

- (NSString)cellularAggregatedULBW
{
  return self->_cellularAggregatedULBW;
}

- (void)setCellularAggregatedULBW:(id)a3
{
  objc_storeStrong((id *)&self->_cellularAggregatedULBW, a3);
}

- (NSString)cellularIssa
{
  return self->_cellularIssa;
}

- (void)setCellularIssa:(id)a3
{
  objc_storeStrong((id *)&self->_cellularIssa, a3);
}

- (NSString)cellularLac
{
  return self->_cellularLac;
}

- (void)setCellularLac:(id)a3
{
  objc_storeStrong((id *)&self->_cellularLac, a3);
}

- (NSString)cellularLteNrConfiguredBw
{
  return self->_cellularLteNrConfiguredBw;
}

- (void)setCellularLteNrConfiguredBw:(id)a3
{
  objc_storeStrong((id *)&self->_cellularLteNrConfiguredBw, a3);
}

- (NSString)cellularMaxDlMod
{
  return self->_cellularMaxDlMod;
}

- (void)setCellularMaxDlMod:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMaxDlMod, a3);
}

- (NSString)cellularMaxNwMimoLyr
{
  return self->_cellularMaxNwMimoLyr;
}

- (void)setCellularMaxNwMimoLyr:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMaxNwMimoLyr, a3);
}

- (NSString)cellularMaxSchdMimoLyr
{
  return self->_cellularMaxSchdMimoLyr;
}

- (void)setCellularMaxSchdMimoLyr:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMaxSchdMimoLyr, a3);
}

- (NSString)cellularMaxUeRank
{
  return self->_cellularMaxUeRank;
}

- (void)setCellularMaxUeRank:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMaxUeRank, a3);
}

- (NSString)cellularMaxUlMod
{
  return self->_cellularMaxUlMod;
}

- (void)setCellularMaxUlMod:(id)a3
{
  objc_storeStrong((id *)&self->_cellularMaxUlMod, a3);
}

- (NSString)cellularNrSinr
{
  return self->_cellularNrSinr;
}

- (void)setCellularNrSinr:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrSinr, a3);
}

- (NSString)cellularNrarfcn
{
  return self->_cellularNrarfcn;
}

- (void)setCellularNrarfcn:(id)a3
{
  objc_storeStrong((id *)&self->_cellularNrarfcn, a3);
}

- (NSString)cellularRadioFrequency
{
  return self->_cellularRadioFrequency;
}

- (void)setCellularRadioFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRadioFrequency, a3);
}

- (NSString)cellularTotalDlMimoLayers
{
  return self->_cellularTotalDlMimoLayers;
}

- (void)setCellularTotalDlMimoLayers:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTotalDlMimoLayers, a3);
}

- (NSString)cellularTotalNumCcs
{
  return self->_cellularTotalNumCcs;
}

- (void)setCellularTotalNumCcs:(id)a3
{
  objc_storeStrong((id *)&self->_cellularTotalNumCcs, a3);
}

- (NSString)downloadStartRadioFrequency
{
  return self->_downloadStartRadioFrequency;
}

- (void)setDownloadStartRadioFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStartRadioFrequency, a3);
}

- (NSString)downloadEndRadioFrequency
{
  return self->_downloadEndRadioFrequency;
}

- (void)setDownloadEndRadioFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEndRadioFrequency, a3);
}

- (NSString)networkPrimaryIpv6InterfaceName
{
  return self->_networkPrimaryIpv6InterfaceName;
}

- (void)setNetworkPrimaryIpv6InterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_networkPrimaryIpv6InterfaceName, a3);
}

- (NSString)networkPrimaryIpv6ServiceName
{
  return self->_networkPrimaryIpv6ServiceName;
}

- (void)setNetworkPrimaryIpv6ServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_networkPrimaryIpv6ServiceName, a3);
}

- (NSString)uploadStartRadioFrequency
{
  return self->_uploadStartRadioFrequency;
}

- (void)setUploadStartRadioFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStartRadioFrequency, a3);
}

- (NSString)uploadEndRadioFrequency
{
  return self->_uploadEndRadioFrequency;
}

- (void)setUploadEndRadioFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_uploadEndRadioFrequency, a3);
}

- (NSString)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
  objc_storeStrong((id *)&self->_downloadError, a3);
}

- (NSString)networkQualityError
{
  return self->_networkQualityError;
}

- (void)setNetworkQualityError:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityError, a3);
}

- (NSString)networkQualityDownloadSpeed
{
  return self->_networkQualityDownloadSpeed;
}

- (void)setNetworkQualityDownloadSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityDownloadSpeed, a3);
}

- (NSString)networkQualityUploadSpeed
{
  return self->_networkQualityUploadSpeed;
}

- (void)setNetworkQualityUploadSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityUploadSpeed, a3);
}

- (NSString)networkQualityRating
{
  return self->_networkQualityRating;
}

- (void)setNetworkQualityRating:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityRating, a3);
}

- (NSString)vpnConnectionState
{
  return self->_vpnConnectionState;
}

- (void)setVpnConnectionState:(id)a3
{
  objc_storeStrong((id *)&self->_vpnConnectionState, a3);
}

- (NSString)uploadError
{
  return self->_uploadError;
}

- (void)setUploadError:(id)a3
{
  objc_storeStrong((id *)&self->_uploadError, a3);
}

- (NSString)uploadErrorDomain
{
  return self->_uploadErrorDomain;
}

- (void)setUploadErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_uploadErrorDomain, a3);
}

- (NSString)uploadErrorCode
{
  return self->_uploadErrorCode;
}

- (void)setUploadErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_uploadErrorCode, a3);
}

- (NSString)downloadErrorDomain
{
  return self->_downloadErrorDomain;
}

- (void)setDownloadErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_downloadErrorDomain, a3);
}

- (NSString)downloadErrorCode
{
  return self->_downloadErrorCode;
}

- (void)setDownloadErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_downloadErrorCode, a3);
}

- (NSString)pingError
{
  return self->_pingError;
}

- (void)setPingError:(id)a3
{
  objc_storeStrong((id *)&self->_pingError, a3);
}

- (NSString)pingErrorDomain
{
  return self->_pingErrorDomain;
}

- (void)setPingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_pingErrorDomain, a3);
}

- (NSString)pingErrorCode
{
  return self->_pingErrorCode;
}

- (void)setPingErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_pingErrorCode, a3);
}

- (NSString)networkQualityErrorDomain
{
  return self->_networkQualityErrorDomain;
}

- (void)setNetworkQualityErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityErrorDomain, a3);
}

- (NSString)networkQualityErrorCode
{
  return self->_networkQualityErrorCode;
}

- (void)setNetworkQualityErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_networkQualityErrorCode, a3);
}

- (NSString)cellularRnMobileCountryCode
{
  return self->_cellularRnMobileCountryCode;
}

- (void)setCellularRnMobileCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRnMobileCountryCode, a3);
}

- (NSString)cellularRnMobileNetworkCode
{
  return self->_cellularRnMobileNetworkCode;
}

- (void)setCellularRnMobileNetworkCode:(id)a3
{
  objc_storeStrong((id *)&self->_cellularRnMobileNetworkCode, a3);
}

- (BOOL)cellularDataIsEnabled
{
  return self->_cellularDataIsEnabled;
}

- (NSString)downloadStartCellularEstimate
{
  return self->_downloadStartCellularEstimate;
}

- (void)setDownloadStartCellularEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStartCellularEstimate, a3);
}

- (NSString)downloadEndCellularEstimate
{
  return self->_downloadEndCellularEstimate;
}

- (void)setDownloadEndCellularEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEndCellularEstimate, a3);
}

- (NSString)downloadMaxCellularEstimate
{
  return self->_downloadMaxCellularEstimate;
}

- (void)setDownloadMaxCellularEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadMaxCellularEstimate, a3);
}

- (NSString)uploadStartCellularEstimate
{
  return self->_uploadStartCellularEstimate;
}

- (void)setUploadStartCellularEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStartCellularEstimate, a3);
}

- (NSString)uploadEndCellularEstimate
{
  return self->_uploadEndCellularEstimate;
}

- (void)setUploadEndCellularEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_uploadEndCellularEstimate, a3);
}

- (NSString)uploadMaxCellularEstimate
{
  return self->_uploadMaxCellularEstimate;
}

- (void)setUploadMaxCellularEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_uploadMaxCellularEstimate, a3);
}

- (NSString)downloadResponsiveness
{
  return self->_downloadResponsiveness;
}

- (void)setDownloadResponsiveness:(id)a3
{
  objc_storeStrong((id *)&self->_downloadResponsiveness, a3);
}

- (NSString)downloadResponsivenessConfidence
{
  return self->_downloadResponsivenessConfidence;
}

- (void)setDownloadResponsivenessConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_downloadResponsivenessConfidence, a3);
}

- (NSString)downloadResponsivenessRating
{
  return self->_downloadResponsivenessRating;
}

- (void)setDownloadResponsivenessRating:(id)a3
{
  objc_storeStrong((id *)&self->_downloadResponsivenessRating, a3);
}

- (NSString)downloadSpeedConfidence
{
  return self->_downloadSpeedConfidence;
}

- (void)setDownloadSpeedConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSpeedConfidence, a3);
}

- (NSString)downloadSpeedRating
{
  return self->_downloadSpeedRating;
}

- (void)setDownloadSpeedRating:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSpeedRating, a3);
}

- (NSString)uploadResponsiveness
{
  return self->_uploadResponsiveness;
}

- (void)setUploadResponsiveness:(id)a3
{
  objc_storeStrong((id *)&self->_uploadResponsiveness, a3);
}

- (NSString)uploadResponsivenessConfidence
{
  return self->_uploadResponsivenessConfidence;
}

- (void)setUploadResponsivenessConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_uploadResponsivenessConfidence, a3);
}

- (NSString)uploadResponsivenessRating
{
  return self->_uploadResponsivenessRating;
}

- (void)setUploadResponsivenessRating:(id)a3
{
  objc_storeStrong((id *)&self->_uploadResponsivenessRating, a3);
}

- (NSString)uploadSpeedConfidence
{
  return self->_uploadSpeedConfidence;
}

- (void)setUploadSpeedConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_uploadSpeedConfidence, a3);
}

- (NSString)uploadSpeedRating
{
  return self->_uploadSpeedRating;
}

- (void)setUploadSpeedRating:(id)a3
{
  objc_storeStrong((id *)&self->_uploadSpeedRating, a3);
}

- (NSString)wifiChannelBand
{
  return self->_wifiChannelBand;
}

- (void)setWifiChannelBand:(id)a3
{
  objc_storeStrong((id *)&self->_wifiChannelBand, a3);
}

- (NSString)wifiChannelWidth
{
  return self->_wifiChannelWidth;
}

- (void)setWifiChannelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_wifiChannelWidth, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrmChannelType, 0);
  objc_storeStrong((id *)&self->_wifiTxRate, 0);
  objc_storeStrong((id *)&self->_wifiSecurity, 0);
  objc_storeStrong((id *)&self->_wifiRssi, 0);
  objc_storeStrong((id *)&self->_wifiPhyMode, 0);
  objc_storeStrong((id *)&self->_wifiOpMode, 0);
  objc_storeStrong((id *)&self->_wifiNumberOfSpatialStreams, 0);
  objc_storeStrong((id *)&self->_wifiNoise, 0);
  objc_storeStrong((id *)&self->_wifiMcsIndex, 0);
  objc_storeStrong((id *)&self->_wifiHiddenState, 0);
  objc_storeStrong((id *)&self->_wifiGuardInterval, 0);
  objc_storeStrong((id *)&self->_wifiEapolSupplicantState, 0);
  objc_storeStrong((id *)&self->_wifiEapolControlMode, 0);
  objc_storeStrong((id *)&self->_wifiCwfCca, 0);
  objc_storeStrong((id *)&self->_wifiChannelWidth, 0);
  objc_storeStrong((id *)&self->_wifiChannelBand, 0);
  objc_storeStrong((id *)&self->_wifiChannel, 0);
  objc_storeStrong((id *)&self->_wifiCca, 0);
  objc_storeStrong((id *)&self->_wifiBtcMode, 0);
  objc_storeStrong((id *)&self->_wifiAverageTcpRtt, 0);
  objc_storeStrong((id *)&self->_wifiAverageSnr, 0);
  objc_storeStrong((id *)&self->_wifiAverageRssi, 0);
  objc_storeStrong((id *)&self->_wifiAveragePhyRateRx, 0);
  objc_storeStrong((id *)&self->_vpnConnectionState, 0);
  objc_storeStrong((id *)&self->_uploadStartRat, 0);
  objc_storeStrong((id *)&self->_uploadStartRadioFrequency, 0);
  objc_storeStrong((id *)&self->_uploadStartPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_uploadStartDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_uploadStartCellularEstimate, 0);
  objc_storeStrong((id *)&self->_uploadStableSpeed, 0);
  objc_storeStrong((id *)&self->_uploadSpeedRating, 0);
  objc_storeStrong((id *)&self->_uploadSpeedConfidence, 0);
  objc_storeStrong((id *)&self->_uploadSpeed, 0);
  objc_storeStrong((id *)&self->_uploadServer, 0);
  objc_storeStrong((id *)&self->_uploadSecureConnectionTime, 0);
  objc_storeStrong((id *)&self->_uploadResponsivenessRating, 0);
  objc_storeStrong((id *)&self->_uploadResponsivenessConfidence, 0);
  objc_storeStrong((id *)&self->_uploadResponsiveness, 0);
  objc_storeStrong((id *)&self->_uploadResponseTime, 0);
  objc_storeStrong((id *)&self->_uploadRequestToResponseTime, 0);
  objc_storeStrong((id *)&self->_uploadRequestTime, 0);
  objc_storeStrong((id *)&self->_uploadRemotePort, 0);
  objc_storeStrong((id *)&self->_uploadRemoteAddress, 0);
  objc_storeStrong((id *)&self->_uploadProtocolName, 0);
  objc_storeStrong((id *)&self->_uploadNumberOfStreams, 0);
  objc_storeStrong((id *)&self->_uploadMaxSpeedObserved, 0);
  objc_storeStrong((id *)&self->_uploadMaxCellularEstimate, 0);
  objc_storeStrong((id *)&self->_uploadInterfaceServiceName, 0);
  objc_storeStrong((id *)&self->_uploadInterfaceName, 0);
  objc_storeStrong((id *)&self->_uploadFileSize, 0);
  objc_storeStrong((id *)&self->_uploadErrorDomain, 0);
  objc_storeStrong((id *)&self->_uploadErrorCode, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
  objc_storeStrong((id *)&self->_uploadEndRat, 0);
  objc_storeStrong((id *)&self->_uploadEndRadioFrequency, 0);
  objc_storeStrong((id *)&self->_uploadEndPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_uploadEndDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_uploadEndCellularEstimate, 0);
  objc_storeStrong((id *)&self->_uploadDomainLookupTime, 0);
  objc_storeStrong((id *)&self->_uploadConnectionTime, 0);
  objc_storeStrong((id *)&self->_uploadCdnUuid, 0);
  objc_storeStrong((id *)&self->_uploadCdnPop, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemProcessorCount, 0);
  objc_storeStrong((id *)&self->_systemPhysicalMemory, 0);
  objc_storeStrong((id *)&self->_systemOsVariant, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_systemDeviceModel, 0);
  objc_storeStrong((id *)&self->_systemDeviceClass, 0);
  objc_storeStrong((id *)&self->_systemBatteryState, 0);
  objc_storeStrong((id *)&self->_systemBatteryLevel, 0);
  objc_storeStrong((id *)&self->_systemActiveProcessorCount, 0);
  objc_storeStrong((id *)&self->_powerStateCaps, 0);
  objc_storeStrong((id *)&self->_powerSourceType, 0);
  objc_storeStrong((id *)&self->_powerBatteryWarningLevel, 0);
  objc_storeStrong((id *)&self->_pingStandardDeviation, 0);
  objc_storeStrong((id *)&self->_pingMinLatency, 0);
  objc_storeStrong((id *)&self->_pingMeanLatency, 0);
  objc_storeStrong((id *)&self->_pingMaxLatency, 0);
  objc_storeStrong((id *)&self->_pingLossPercent, 0);
  objc_storeStrong((id *)&self->_pingErrorDomain, 0);
  objc_storeStrong((id *)&self->_pingErrorCode, 0);
  objc_storeStrong((id *)&self->_pingError, 0);
  objc_storeStrong((id *)&self->_pingAddress, 0);
  objc_storeStrong((id *)&self->_performanceTestStartTime, 0);
  objc_storeStrong((id *)&self->_nptkitFrameworkVersion, 0);
  objc_storeStrong((id *)&self->_networkQualityUploadSpeed, 0);
  objc_storeStrong((id *)&self->_networkQualityResponsiveness, 0);
  objc_storeStrong((id *)&self->_networkQualityRating, 0);
  objc_storeStrong((id *)&self->_networkQualityErrorDomain, 0);
  objc_storeStrong((id *)&self->_networkQualityErrorCode, 0);
  objc_storeStrong((id *)&self->_networkQualityError, 0);
  objc_storeStrong((id *)&self->_networkQualityDownloadSpeed, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv6ServiceName, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv6InterfaceName, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv4ServiceName, 0);
  objc_storeStrong((id *)&self->_networkPrimaryIpv4InterfaceName, 0);
  objc_storeStrong((id *)&self->_downloadStartRat, 0);
  objc_storeStrong((id *)&self->_downloadStartRadioFrequency, 0);
  objc_storeStrong((id *)&self->_downloadStartPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_downloadStartDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_downloadStartCellularEstimate, 0);
  objc_storeStrong((id *)&self->_downloadStableSpeed, 0);
  objc_storeStrong((id *)&self->_downloadSpeedRating, 0);
  objc_storeStrong((id *)&self->_downloadSpeedConfidence, 0);
  objc_storeStrong((id *)&self->_downloadSpeed, 0);
  objc_storeStrong((id *)&self->_downloadServer, 0);
  objc_storeStrong((id *)&self->_downloadSecureConnectionTime, 0);
  objc_storeStrong((id *)&self->_downloadResponsivenessRating, 0);
  objc_storeStrong((id *)&self->_downloadResponsivenessConfidence, 0);
  objc_storeStrong((id *)&self->_downloadResponsiveness, 0);
  objc_storeStrong((id *)&self->_downloadResponseTime, 0);
  objc_storeStrong((id *)&self->_downloadRequestToResponseTime, 0);
  objc_storeStrong((id *)&self->_downloadRequestTime, 0);
  objc_storeStrong((id *)&self->_downloadRemotePort, 0);
  objc_storeStrong((id *)&self->_downloadRemoteAddress, 0);
  objc_storeStrong((id *)&self->_downloadProtocolName, 0);
  objc_storeStrong((id *)&self->_downloadNumberOfStreams, 0);
  objc_storeStrong((id *)&self->_downloadMaxSpeedObserved, 0);
  objc_storeStrong((id *)&self->_downloadMaxCellularEstimate, 0);
  objc_storeStrong((id *)&self->_downloadInterfaceServiceName, 0);
  objc_storeStrong((id *)&self->_downloadInterfaceName, 0);
  objc_storeStrong((id *)&self->_downloadFileSize, 0);
  objc_storeStrong((id *)&self->_downloadErrorDomain, 0);
  objc_storeStrong((id *)&self->_downloadErrorCode, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_downloadEndRat, 0);
  objc_storeStrong((id *)&self->_downloadEndRadioFrequency, 0);
  objc_storeStrong((id *)&self->_downloadEndPrimaryIpv4Interface, 0);
  objc_storeStrong((id *)&self->_downloadEndDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_downloadEndCellularEstimate, 0);
  objc_storeStrong((id *)&self->_downloadDomainLookupTime, 0);
  objc_storeStrong((id *)&self->_downloadConnectionTime, 0);
  objc_storeStrong((id *)&self->_downloadCdnUuid, 0);
  objc_storeStrong((id *)&self->_downloadCdnPop, 0);
  objc_storeStrong((id *)&self->_cellularUarfcn, 0);
  objc_storeStrong((id *)&self->_cellularTotalNumCcs, 0);
  objc_storeStrong((id *)&self->_cellularTotalLayers, 0);
  objc_storeStrong((id *)&self->_cellularTotalDlMimoLayers, 0);
  objc_storeStrong((id *)&self->_cellularTotalCcs, 0);
  objc_storeStrong((id *)&self->_cellularTotalBw, 0);
  objc_storeStrong((id *)&self->_cellularTotalActiveContexts, 0);
  objc_storeStrong((id *)&self->_cellularTac, 0);
  objc_storeStrong((id *)&self->_cellularSnr, 0);
  objc_storeStrong((id *)&self->_cellularRsrp, 0);
  objc_storeStrong((id *)&self->_cellularRoamAllowed, 0);
  objc_storeStrong((id *)&self->_cellularRnMobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_cellularRnMobileCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularRadioFrequency, 0);
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnologyCtDataStatus, 0);
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_cellularPid, 0);
  objc_storeStrong((id *)&self->_cellularNrarfcn, 0);
  objc_storeStrong((id *)&self->_cellularNrSnr, 0);
  objc_storeStrong((id *)&self->_cellularNrSinr, 0);
  objc_storeStrong((id *)&self->_cellularNrRsrq, 0);
  objc_storeStrong((id *)&self->_cellularNrRsrp, 0);
  objc_storeStrong((id *)&self->_cellularNrModulation, 0);
  objc_storeStrong((id *)&self->_cellularNrLayers, 0);
  objc_storeStrong((id *)&self->_cellularNrConfiguredBw, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioSub6DataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioSaDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioSaCoverage, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioNsaDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioNsaCoverage, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioMmwaveDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioDataBearer, 0);
  objc_storeStrong((id *)&self->_cellularNewRadioCoverage, 0);
  objc_storeStrong((id *)&self->_cellularMobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_cellularMobileCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularMaxUlMod, 0);
  objc_storeStrong((id *)&self->_cellularMaxUeRank, 0);
  objc_storeStrong((id *)&self->_cellularMaxSchdMimoLyr, 0);
  objc_storeStrong((id *)&self->_cellularMaxNwMimoLyr, 0);
  objc_storeStrong((id *)&self->_cellularMaxDlMod, 0);
  objc_storeStrong((id *)&self->_cellularLteNrConfiguredBw, 0);
  objc_storeStrong((id *)&self->_cellularLteMaxScheduledLayers, 0);
  objc_storeStrong((id *)&self->_cellularLqm, 0);
  objc_storeStrong((id *)&self->_cellularLac, 0);
  objc_storeStrong((id *)&self->_cellularIssa, 0);
  objc_storeStrong((id *)&self->_cellularIsoCountryCode, 0);
  objc_storeStrong((id *)&self->_cellularIndicatorOverride, 0);
  objc_storeStrong((id *)&self->_cellularIndicator, 0);
  objc_storeStrong((id *)&self->_cellularInHomeCountry, 0);
  objc_storeStrong((id *)&self->_cellularDataPossible, 0);
  objc_storeStrong((id *)&self->_cellularDataPlanSignalingReductionOverride, 0);
  objc_storeStrong((id *)&self->_cellularDataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_cellularDataBearerSoMask, 0);
  objc_storeStrong((id *)&self->_cellularCellid, 0);
  objc_storeStrong((id *)&self->_cellularCarrierName, 0);
  objc_storeStrong((id *)&self->_cellularBandwidth, 0);
  objc_storeStrong((id *)&self->_cellularBandinfo, 0);
  objc_storeStrong((id *)&self->_cellularAttached, 0);
  objc_storeStrong((id *)&self->_cellularAggregatedULBW, 0);
  objc_storeStrong((id *)&self->_cellularAggregatedDLBW, 0);
  objc_storeStrong((id *)&self->_cellularActiveContexts, 0);
  objc_storeStrong((id *)&self->_callingClient, 0);
  objc_storeStrong((id *)&self->_btConnectedDevicesCount, 0);
  objc_storeStrong((id *)&self->_awdlSyncState, 0);
  objc_storeStrong((id *)&self->_awdlSyncChannelSequence, 0);
  objc_storeStrong((id *)&self->_awdlSecondaryMasterChannel, 0);
  objc_storeStrong((id *)&self->_awdlSchedule, 0);
  objc_storeStrong((id *)&self->_awdlOpMode, 0);
  objc_storeStrong((id *)&self->_awdlMasterChannel, 0);
  objc_storeStrong((id *)&self->_awdlElectionParameters, 0);
}

@end
