@implementation HMProtoResidentCapabilities

- (BOOL)hasTag
{
  return self->_tag != 0;
}

- (void)setSupportsCameraRecording:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_supportsCameraRecording = a3;
}

- (void)setHasSupportsCameraRecording:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasSupportsCameraRecording
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSupportsRouterManagement:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_supportsRouterManagement = a3;
}

- (void)setHasSupportsRouterManagement:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSupportsRouterManagement
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSupportsShortcutActions:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_supportsShortcutActions = a3;
}

- (void)setHasSupportsShortcutActions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSupportsShortcutActions
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSupportsMediaActions:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_supportsMediaActions = a3;
}

- (void)setHasSupportsMediaActions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSupportsMediaActions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSupportsCameraSignificantEventNotifications:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_supportsCameraSignificantEventNotifications = a3;
}

- (void)setHasSupportsCameraSignificantEventNotifications:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasSupportsCameraSignificantEventNotifications
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSupportsFirmwareUpdate:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_supportsFirmwareUpdate = a3;
}

- (void)setHasSupportsFirmwareUpdate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSupportsFirmwareUpdate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSupportsResidentFirmwareUpdate:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_supportsResidentFirmwareUpdate = a3;
}

- (void)setHasSupportsResidentFirmwareUpdate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSupportsResidentFirmwareUpdate
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSupportsCameraActivityZones:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_supportsCameraActivityZones = a3;
}

- (void)setHasSupportsCameraActivityZones:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSupportsCameraActivityZones
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setSupportsFaceClassification:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_supportsFaceClassification = a3;
}

- (void)setHasSupportsFaceClassification:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSupportsFaceClassification
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSupportsNaturalLighting:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_supportsNaturalLighting = a3;
}

- (void)setHasSupportsNaturalLighting:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasSupportsNaturalLighting
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSupportsCameraRecordingReachabilityNotifications:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_supportsCameraRecordingReachabilityNotifications = a3;
}

- (void)setHasSupportsCameraRecordingReachabilityNotifications:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasSupportsCameraRecordingReachabilityNotifications
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSupportsAnnounce:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_supportsAnnounce = a3;
}

- (void)setHasSupportsAnnounce:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasSupportsAnnounce
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSupportsWakeOnLAN:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_supportsWakeOnLAN = a3;
}

- (void)setHasSupportsWakeOnLAN:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsWakeOnLAN
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setSupportsLockNotificationContext:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_supportsLockNotificationContext = a3;
}

- (void)setHasSupportsLockNotificationContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSupportsLockNotificationContext
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSupportsWalletKey:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_supportsWalletKey = a3;
}

- (void)setHasSupportsWalletKey:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsWalletKey
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setSupportsCameraPackageDetection:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_supportsCameraPackageDetection = a3;
}

- (void)setHasSupportsCameraPackageDetection:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasSupportsCameraPackageDetection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSupportsAccessCodes:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_supportsAccessCodes = a3;
}

- (void)setHasSupportsAccessCodes:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasSupportsAccessCodes
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSupportsCHIP:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_supportsCHIP = a3;
}

- (void)setHasSupportsCHIP:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasSupportsCHIP
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSupportsThreadBorderRouter:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_supportsThreadBorderRouter = a3;
}

- (void)setHasSupportsThreadBorderRouter:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasSupportsThreadBorderRouter
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setSupportsSiriEndpointSetup:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_supportsSiriEndpointSetup = a3;
}

- (void)setHasSupportsSiriEndpointSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSupportsSiriEndpointSetup
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSupportsCustomMediaApplicationDestination:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_supportsCustomMediaApplicationDestination = a3;
}

- (void)setHasSupportsCustomMediaApplicationDestination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasSupportsCustomMediaApplicationDestination
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSupportsUnifiedMediaNotifications:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_supportsUnifiedMediaNotifications = a3;
}

- (void)setHasSupportsUnifiedMediaNotifications:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsUnifiedMediaNotifications
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setSupportsHomeHub:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_supportsHomeHub = a3;
}

- (void)setHasSupportsHomeHub:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSupportsHomeHub
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSupportsResidentFirstAccessoryCommunication:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_supportsResidentFirstAccessoryCommunication = a3;
}

- (void)setHasSupportsResidentFirstAccessoryCommunication:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSupportsResidentFirstAccessoryCommunication
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSupportsThreadNetworkCredentialSharing:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_supportsThreadNetworkCredentialSharing = a3;
}

- (void)setHasSupportsThreadNetworkCredentialSharing:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasSupportsThreadNetworkCredentialSharing
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setSupports5348b248a25f84b0c83e:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_supports5348b248a25f84b0c83e = a3;
}

- (void)setHasSupports5348b248a25f84b0c83e:(BOOL)a3
{
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasSupports5348b248a25f84b0c83e
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSupportsEventLog:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_supportsEventLog = a3;
}

- (void)setHasSupportsEventLog:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasSupportsEventLog
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSupportsMatterTTU:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_supportsMatterTTU = a3;
}

- (void)setHasSupportsMatterTTU:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSupportsMatterTTU
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSupportsDistributedExecutionOnPrimary:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_supportsDistributedExecutionOnPrimary = a3;
}

- (void)setHasSupportsDistributedExecutionOnPrimary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasSupportsDistributedExecutionOnPrimary
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSupportsResidentActionSetStateEvaluation:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_supportsResidentActionSetStateEvaluation = a3;
}

- (void)setHasSupportsResidentActionSetStateEvaluation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSupportsResidentActionSetStateEvaluation
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSupports9907491178:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_supports9907491178 = a3;
}

- (void)setHasSupports9907491178:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSupports9907491178
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSupports6b6244b25f264f02:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_supports6b6244b25f264f02 = a3;
}

- (void)setHasSupports6b6244b25f264f02:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSupports6b6244b25f264f02
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportsMatterOwnerCertFetch:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_supportsMatterOwnerCertFetch = a3;
}

- (void)setHasSupportsMatterOwnerCertFetch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSupportsMatterOwnerCertFetch
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSupportsa15324f096ec183d:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_supportsa15324f096ec183d = a3;
}

- (void)setHasSupportsa15324f096ec183d:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSupportsa15324f096ec183d
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setSupports7cbb2355da029df2:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_supports7cbb2355da029df2 = a3;
}

- (void)setHasSupports7cbb2355da029df2:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasSupports7cbb2355da029df2
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupports946950341b318ffd:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_supports946950341b318ffd = a3;
}

- (void)setHasSupports946950341b318ffd:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($EC8BE96078CDF0FEF183BB4D0D0CC05F)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasSupports946950341b318ffd
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMProtoResidentCapabilities;
  -[HMProtoResidentCapabilities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMProtoResidentCapabilities dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tag;
  $EC8BE96078CDF0FEF183BB4D0D0CC05F has;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tag = self->_tag;
  if (tag)
    objc_msgSend(v3, "setObject:forKey:", tag, CFSTR("tag"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCameraRecording);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("supportsCameraRecording"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsRouterManagement);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("supportsRouterManagement"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsShortcutActions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("supportsShortcutActions"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMediaActions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("supportsMediaActions"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCameraSignificantEventNotifications);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("supportsCameraSignificantEventNotifications"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFirmwareUpdate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("supportsFirmwareUpdate"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsResidentFirmwareUpdate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("supportsResidentFirmwareUpdate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCameraActivityZones);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("supportsCameraActivityZones"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFaceClassification);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("supportsFaceClassification"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsNaturalLighting);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("supportsNaturalLighting"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCameraRecordingReachabilityNotifications);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("supportsCameraRecordingReachabilityNotifications"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAnnounce);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("supportsAnnounce"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsWakeOnLAN);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("supportsWakeOnLAN"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsLockNotificationContext);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("supportsLockNotificationContext"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsWalletKey);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("supportsWalletKey"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCameraPackageDetection);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("supportsCameraPackageDetection"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAccessCodes);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("supportsAccessCodes"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCHIP);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("supportsCHIP"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsThreadBorderRouter);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("supportsThreadBorderRouter"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSiriEndpointSetup);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("supportsSiriEndpointSetup"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCustomMediaApplicationDestination);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("supportsCustomMediaApplicationDestination"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsUnifiedMediaNotifications);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("supportsUnifiedMediaNotifications"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHomeHub);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("supportsHomeHub"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsResidentFirstAccessoryCommunication);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("supportsResidentFirstAccessoryCommunication"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsThreadNetworkCredentialSharing);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("supportsThreadNetworkCredentialSharing"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports5348b248a25f84b0c83e);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("supports5348b248a25f84b0c83e"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsEventLog);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("supportsEventLog"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMatterTTU);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("supportsMatterTTU"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsDistributedExecutionOnPrimary);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("supportsDistributedExecutionOnPrimary"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsResidentActionSetStateEvaluation);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("supportsResidentActionSetStateEvaluation"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports9907491178);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("supports9907491178"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports6b6244b25f264f02);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("supports6b6244b25f264f02"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMatterOwnerCertFetch);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("supportsMatterOwnerCertFetch"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
LABEL_75:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports7cbb2355da029df2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("supports7cbb2355da029df2"));

    if ((*(_QWORD *)&self->_has & 8) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsa15324f096ec183d);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("supportsa15324f096ec183d"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_75;
LABEL_38:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports946950341b318ffd);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("supports946950341b318ffd"));

  }
LABEL_40:
  v8 = v4;

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return HMProtoResidentCapabilitiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $EC8BE96078CDF0FEF183BB4D0D0CC05F has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_tag)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
LABEL_75:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_QWORD *)&self->_has & 8) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_75;
LABEL_38:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_39:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_40:

}

- (void)copyTo:(id)a3
{
  char *v4;
  $EC8BE96078CDF0FEF183BB4D0D0CC05F has;
  char *v6;

  v4 = (char *)a3;
  if (self->_tag)
  {
    v6 = v4;
    objc_msgSend(v4, "setTag:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v4[26] = self->_supportsCameraRecording;
    *(_QWORD *)(v4 + 52) |= 0x400uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  v4[43] = self->_supportsRouterManagement;
  *(_QWORD *)(v4 + 52) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  v4[44] = self->_supportsShortcutActions;
  *(_QWORD *)(v4 + 52) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  v4[38] = self->_supportsMediaActions;
  *(_QWORD *)(v4 + 52) |= 0x400000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  v4[28] = self->_supportsCameraSignificantEventNotifications;
  *(_QWORD *)(v4 + 52) |= 0x1000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  v4[33] = self->_supportsFirmwareUpdate;
  *(_QWORD *)(v4 + 52) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  v4[41] = self->_supportsResidentFirmwareUpdate;
  *(_QWORD *)(v4 + 52) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  v4[24] = self->_supportsCameraActivityZones;
  *(_QWORD *)(v4 + 52) |= 0x100uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  v4[32] = self->_supportsFaceClassification;
  *(_QWORD *)(v4 + 52) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  v4[39] = self->_supportsNaturalLighting;
  *(_QWORD *)(v4 + 52) |= 0x800000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  v4[27] = self->_supportsCameraRecordingReachabilityNotifications;
  *(_QWORD *)(v4 + 52) |= 0x800uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  v4[22] = self->_supportsAnnounce;
  *(_QWORD *)(v4 + 52) |= 0x40uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  v4[49] = self->_supportsWakeOnLAN;
  *(_QWORD *)(v4 + 52) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  v4[35] = self->_supportsLockNotificationContext;
  *(_QWORD *)(v4 + 52) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  v4[50] = self->_supportsWalletKey;
  *(_QWORD *)(v4 + 52) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  v4[25] = self->_supportsCameraPackageDetection;
  *(_QWORD *)(v4 + 52) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  v4[21] = self->_supportsAccessCodes;
  *(_QWORD *)(v4 + 52) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  v4[23] = self->_supportsCHIP;
  *(_QWORD *)(v4 + 52) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  v4[46] = self->_supportsThreadBorderRouter;
  *(_QWORD *)(v4 + 52) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  v4[45] = self->_supportsSiriEndpointSetup;
  *(_QWORD *)(v4 + 52) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  v4[29] = self->_supportsCustomMediaApplicationDestination;
  *(_QWORD *)(v4 + 52) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  v4[48] = self->_supportsUnifiedMediaNotifications;
  *(_QWORD *)(v4 + 52) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  v4[34] = self->_supportsHomeHub;
  *(_QWORD *)(v4 + 52) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  v4[42] = self->_supportsResidentFirstAccessoryCommunication;
  *(_QWORD *)(v4 + 52) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  v4[47] = self->_supportsThreadNetworkCredentialSharing;
  *(_QWORD *)(v4 + 52) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  v4[16] = self->_supports5348b248a25f84b0c83e;
  *(_QWORD *)(v4 + 52) |= 1uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  v4[31] = self->_supportsEventLog;
  *(_QWORD *)(v4 + 52) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  v4[37] = self->_supportsMatterTTU;
  *(_QWORD *)(v4 + 52) |= 0x200000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  v4[30] = self->_supportsDistributedExecutionOnPrimary;
  *(_QWORD *)(v4 + 52) |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  v4[40] = self->_supportsResidentActionSetStateEvaluation;
  *(_QWORD *)(v4 + 52) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  v4[20] = self->_supports9907491178;
  *(_QWORD *)(v4 + 52) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  v4[17] = self->_supports6b6244b25f264f02;
  *(_QWORD *)(v4 + 52) |= 2uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_74;
  }
LABEL_73:
  v4[36] = self->_supportsMatterOwnerCertFetch;
  *(_QWORD *)(v4 + 52) |= 0x100000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_38;
LABEL_75:
    v4[18] = self->_supports7cbb2355da029df2;
    *(_QWORD *)(v4 + 52) |= 4uLL;
    if ((*(_QWORD *)&self->_has & 8) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_74:
  v4[51] = self->_supportsa15324f096ec183d;
  *(_QWORD *)(v4 + 52) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_75;
LABEL_38:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_39:
    v4[19] = self->_supports946950341b318ffd;
    *(_QWORD *)(v4 + 52) |= 8uLL;
  }
LABEL_40:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $EC8BE96078CDF0FEF183BB4D0D0CC05F has;
  id v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tag, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 26) = self->_supportsCameraRecording;
    *(_QWORD *)(v5 + 52) |= 0x400uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 43) = self->_supportsRouterManagement;
  *(_QWORD *)(v5 + 52) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 44) = self->_supportsShortcutActions;
  *(_QWORD *)(v5 + 52) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  *(_BYTE *)(v5 + 38) = self->_supportsMediaActions;
  *(_QWORD *)(v5 + 52) |= 0x400000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  *(_BYTE *)(v5 + 28) = self->_supportsCameraSignificantEventNotifications;
  *(_QWORD *)(v5 + 52) |= 0x1000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  *(_BYTE *)(v5 + 33) = self->_supportsFirmwareUpdate;
  *(_QWORD *)(v5 + 52) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 41) = self->_supportsResidentFirmwareUpdate;
  *(_QWORD *)(v5 + 52) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  *(_BYTE *)(v5 + 24) = self->_supportsCameraActivityZones;
  *(_QWORD *)(v5 + 52) |= 0x100uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v5 + 32) = self->_supportsFaceClassification;
  *(_QWORD *)(v5 + 52) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v5 + 39) = self->_supportsNaturalLighting;
  *(_QWORD *)(v5 + 52) |= 0x800000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  *(_BYTE *)(v5 + 27) = self->_supportsCameraRecordingReachabilityNotifications;
  *(_QWORD *)(v5 + 52) |= 0x800uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  *(_BYTE *)(v5 + 22) = self->_supportsAnnounce;
  *(_QWORD *)(v5 + 52) |= 0x40uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  *(_BYTE *)(v5 + 49) = self->_supportsWakeOnLAN;
  *(_QWORD *)(v5 + 52) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  *(_BYTE *)(v5 + 35) = self->_supportsLockNotificationContext;
  *(_QWORD *)(v5 + 52) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  *(_BYTE *)(v5 + 50) = self->_supportsWalletKey;
  *(_QWORD *)(v5 + 52) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v5 + 25) = self->_supportsCameraPackageDetection;
  *(_QWORD *)(v5 + 52) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  *(_BYTE *)(v5 + 21) = self->_supportsAccessCodes;
  *(_QWORD *)(v5 + 52) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  *(_BYTE *)(v5 + 23) = self->_supportsCHIP;
  *(_QWORD *)(v5 + 52) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  *(_BYTE *)(v5 + 46) = self->_supportsThreadBorderRouter;
  *(_QWORD *)(v5 + 52) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  *(_BYTE *)(v5 + 45) = self->_supportsSiriEndpointSetup;
  *(_QWORD *)(v5 + 52) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  *(_BYTE *)(v5 + 29) = self->_supportsCustomMediaApplicationDestination;
  *(_QWORD *)(v5 + 52) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  *(_BYTE *)(v5 + 48) = self->_supportsUnifiedMediaNotifications;
  *(_QWORD *)(v5 + 52) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  *(_BYTE *)(v5 + 34) = self->_supportsHomeHub;
  *(_QWORD *)(v5 + 52) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v5 + 42) = self->_supportsResidentFirstAccessoryCommunication;
  *(_QWORD *)(v5 + 52) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v5 + 47) = self->_supportsThreadNetworkCredentialSharing;
  *(_QWORD *)(v5 + 52) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  *(_BYTE *)(v5 + 16) = self->_supports5348b248a25f84b0c83e;
  *(_QWORD *)(v5 + 52) |= 1uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 31) = self->_supportsEventLog;
  *(_QWORD *)(v5 + 52) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  *(_BYTE *)(v5 + 37) = self->_supportsMatterTTU;
  *(_QWORD *)(v5 + 52) |= 0x200000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 30) = self->_supportsDistributedExecutionOnPrimary;
  *(_QWORD *)(v5 + 52) |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v5 + 40) = self->_supportsResidentActionSetStateEvaluation;
  *(_QWORD *)(v5 + 52) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  *(_BYTE *)(v5 + 20) = self->_supports9907491178;
  *(_QWORD *)(v5 + 52) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  *(_BYTE *)(v5 + 17) = self->_supports6b6244b25f264f02;
  *(_QWORD *)(v5 + 52) |= 2uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  *(_BYTE *)(v5 + 36) = self->_supportsMatterOwnerCertFetch;
  *(_QWORD *)(v5 + 52) |= 0x100000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_36;
LABEL_73:
    *(_BYTE *)(v5 + 18) = self->_supports7cbb2355da029df2;
    *(_QWORD *)(v5 + 52) |= 4uLL;
    if ((*(_QWORD *)&self->_has & 8) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_72:
  *(_BYTE *)(v5 + 51) = self->_supportsa15324f096ec183d;
  *(_QWORD *)(v5 + 52) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_73;
LABEL_36:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_37:
    *(_BYTE *)(v5 + 19) = self->_supports946950341b318ffd;
    *(_QWORD *)(v5 + 52) |= 8uLL;
  }
LABEL_38:
  v9 = (id)v5;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *tag;
  $EC8BE96078CDF0FEF183BB4D0D0CC05F has;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_287;
  tag = self->_tag;
  if ((unint64_t)tag | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](tag, "isEqual:"))
      goto LABEL_287;
  }
  has = self->_has;
  v7 = *(_QWORD *)(v4 + 52);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0)
      goto LABEL_287;
    if (self->_supportsCameraRecording)
    {
      if (!v4[26])
        goto LABEL_287;
    }
    else if (v4[26])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0)
      goto LABEL_287;
    if (self->_supportsRouterManagement)
    {
      if (!v4[43])
        goto LABEL_287;
    }
    else if (v4[43])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0)
      goto LABEL_287;
    if (self->_supportsShortcutActions)
    {
      if (!v4[44])
        goto LABEL_287;
    }
    else if (v4[44])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0)
      goto LABEL_287;
    if (self->_supportsMediaActions)
    {
      if (!v4[38])
        goto LABEL_287;
    }
    else if (v4[38])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0)
      goto LABEL_287;
    if (self->_supportsCameraSignificantEventNotifications)
    {
      if (!v4[28])
        goto LABEL_287;
    }
    else if (v4[28])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0)
      goto LABEL_287;
    if (self->_supportsFirmwareUpdate)
    {
      if (!v4[33])
        goto LABEL_287;
    }
    else if (v4[33])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0)
      goto LABEL_287;
    if (self->_supportsResidentFirmwareUpdate)
    {
      if (!v4[41])
        goto LABEL_287;
    }
    else if (v4[41])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_287;
    if (self->_supportsCameraActivityZones)
    {
      if (!v4[24])
        goto LABEL_287;
    }
    else if (v4[24])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0)
      goto LABEL_287;
    if (self->_supportsFaceClassification)
    {
      if (!v4[32])
        goto LABEL_287;
    }
    else if (v4[32])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0)
      goto LABEL_287;
    if (self->_supportsNaturalLighting)
    {
      if (!v4[39])
        goto LABEL_287;
    }
    else if (v4[39])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0)
      goto LABEL_287;
    if (self->_supportsCameraRecordingReachabilityNotifications)
    {
      if (!v4[27])
        goto LABEL_287;
    }
    else if (v4[27])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_287;
    if (self->_supportsAnnounce)
    {
      if (!v4[22])
        goto LABEL_287;
    }
    else if (v4[22])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0)
      goto LABEL_287;
    if (self->_supportsWakeOnLAN)
    {
      if (!v4[49])
        goto LABEL_287;
    }
    else if (v4[49])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0)
      goto LABEL_287;
    if (self->_supportsLockNotificationContext)
    {
      if (!v4[35])
        goto LABEL_287;
    }
    else if (v4[35])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0)
      goto LABEL_287;
    if (self->_supportsWalletKey)
    {
      if (!v4[50])
        goto LABEL_287;
    }
    else if (v4[50])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0)
      goto LABEL_287;
    if (self->_supportsCameraPackageDetection)
    {
      if (!v4[25])
        goto LABEL_287;
    }
    else if (v4[25])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_287;
    if (self->_supportsAccessCodes)
    {
      if (!v4[21])
        goto LABEL_287;
    }
    else if (v4[21])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_287;
    if (self->_supportsCHIP)
    {
      if (!v4[23])
        goto LABEL_287;
    }
    else if (v4[23])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0)
      goto LABEL_287;
    if (self->_supportsThreadBorderRouter)
    {
      if (!v4[46])
        goto LABEL_287;
    }
    else if (v4[46])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0)
      goto LABEL_287;
    if (self->_supportsSiriEndpointSetup)
    {
      if (!v4[45])
        goto LABEL_287;
    }
    else if (v4[45])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0)
      goto LABEL_287;
    if (self->_supportsCustomMediaApplicationDestination)
    {
      if (!v4[29])
        goto LABEL_287;
    }
    else if (v4[29])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0)
      goto LABEL_287;
    if (self->_supportsUnifiedMediaNotifications)
    {
      if (!v4[48])
        goto LABEL_287;
    }
    else if (v4[48])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0)
      goto LABEL_287;
    if (self->_supportsHomeHub)
    {
      if (!v4[34])
        goto LABEL_287;
    }
    else if (v4[34])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0)
      goto LABEL_287;
    if (self->_supportsResidentFirstAccessoryCommunication)
    {
      if (!v4[42])
        goto LABEL_287;
    }
    else if (v4[42])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0)
      goto LABEL_287;
    if (self->_supportsThreadNetworkCredentialSharing)
    {
      if (!v4[47])
        goto LABEL_287;
    }
    else if (v4[47])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_287;
    if (self->_supports5348b248a25f84b0c83e)
    {
      if (!v4[16])
        goto LABEL_287;
    }
    else if (v4[16])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0)
      goto LABEL_287;
    if (self->_supportsEventLog)
    {
      if (!v4[31])
        goto LABEL_287;
    }
    else if (v4[31])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0)
      goto LABEL_287;
    if (self->_supportsMatterTTU)
    {
      if (!v4[37])
        goto LABEL_287;
    }
    else if (v4[37])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0)
      goto LABEL_287;
    if (self->_supportsDistributedExecutionOnPrimary)
    {
      if (!v4[30])
        goto LABEL_287;
    }
    else if (v4[30])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0)
      goto LABEL_287;
    if (self->_supportsResidentActionSetStateEvaluation)
    {
      if (!v4[40])
        goto LABEL_287;
    }
    else if (v4[40])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_287;
    if (self->_supports9907491178)
    {
      if (!v4[20])
        goto LABEL_287;
    }
    else if (v4[20])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_287;
    if (self->_supports6b6244b25f264f02)
    {
      if (!v4[17])
        goto LABEL_287;
    }
    else if (v4[17])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0)
      goto LABEL_287;
    if (self->_supportsMatterOwnerCertFetch)
    {
      if (!v4[36])
        goto LABEL_287;
    }
    else if (v4[36])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0)
      goto LABEL_287;
    if (self->_supportsa15324f096ec183d)
    {
      if (!v4[51])
        goto LABEL_287;
    }
    else if (v4[51])
    {
      goto LABEL_287;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_287;
  }
  v8 = *(_QWORD *)(v4 + 52);
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0)
      goto LABEL_287;
    if (self->_supports7cbb2355da029df2)
    {
      if (!v4[18])
        goto LABEL_287;
    }
    else if (v4[18])
    {
      goto LABEL_287;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_287;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v8 & 8) != 0)
    {
      if (self->_supports946950341b318ffd)
      {
        if (!v4[19])
          goto LABEL_287;
      }
      else if (v4[19])
      {
        goto LABEL_287;
      }
      v9 = 1;
      goto LABEL_288;
    }
LABEL_287:
    v9 = 0;
    goto LABEL_288;
  }
  v9 = (*(_QWORD *)(v4 + 52) & 8) == 0;
LABEL_288:

  return v9;
}

- (unint64_t)hash
{
  $EC8BE96078CDF0FEF183BB4D0D0CC05F has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSUInteger v41;

  v41 = -[NSString hash](self->_tag, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v40 = 2654435761 * self->_supportsCameraRecording;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_3:
      v39 = 2654435761 * self->_supportsRouterManagement;
      if ((*(_DWORD *)&has & 0x10000000) != 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else
  {
    v40 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_3;
  }
  v39 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_4:
    v38 = 2654435761 * self->_supportsShortcutActions;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    v37 = 2654435761 * self->_supportsMediaActions;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  v37 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_6:
    v36 = 2654435761 * self->_supportsCameraSignificantEventNotifications;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_7:
    v35 = 2654435761 * self->_supportsFirmwareUpdate;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_8:
    v34 = 2654435761 * self->_supportsResidentFirmwareUpdate;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  v34 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    v33 = 2654435761 * self->_supportsCameraActivityZones;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    v32 = 2654435761 * self->_supportsFaceClassification;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_11:
    v31 = 2654435761 * self->_supportsNaturalLighting;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  v31 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    v4 = 2654435761 * self->_supportsCameraRecordingReachabilityNotifications;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_13:
    v5 = 2654435761 * self->_supportsAnnounce;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  v5 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_14:
    v6 = 2654435761 * self->_supportsWakeOnLAN;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_15:
    v7 = 2654435761 * self->_supportsLockNotificationContext;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  v7 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_16:
    v8 = 2654435761 * self->_supportsWalletKey;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  v8 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_17:
    v9 = 2654435761 * self->_supportsCameraPackageDetection;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_18:
    v10 = 2654435761 * self->_supportsAccessCodes;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  v10 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_19:
    v11 = 2654435761 * self->_supportsCHIP;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_20:
    v12 = 2654435761 * self->_supportsThreadBorderRouter;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_21:
    v13 = 2654435761 * self->_supportsSiriEndpointSetup;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_22:
    v14 = 2654435761 * self->_supportsCustomMediaApplicationDestination;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_23:
    v15 = 2654435761 * self->_supportsUnifiedMediaNotifications;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_24:
    v16 = 2654435761 * self->_supportsHomeHub;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_25:
    v17 = 2654435761 * self->_supportsResidentFirstAccessoryCommunication;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_26:
    v18 = 2654435761 * self->_supportsThreadNetworkCredentialSharing;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  v18 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_27:
    v19 = 2654435761 * self->_supports5348b248a25f84b0c83e;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  v19 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_28:
    v20 = 2654435761 * self->_supportsEventLog;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_29:
    v21 = 2654435761 * self->_supportsMatterTTU;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_30;
    goto LABEL_66;
  }
LABEL_65:
  v21 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_30:
    v22 = 2654435761 * self->_supportsDistributedExecutionOnPrimary;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_31;
    goto LABEL_67;
  }
LABEL_66:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_31:
    v23 = 2654435761 * self->_supportsResidentActionSetStateEvaluation;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_32;
    goto LABEL_68;
  }
LABEL_67:
  v23 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_32:
    v24 = 2654435761 * self->_supports9907491178;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_33;
    goto LABEL_69;
  }
LABEL_68:
  v24 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_33:
    v25 = 2654435761 * self->_supports6b6244b25f264f02;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_34;
    goto LABEL_70;
  }
LABEL_69:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_34:
    v26 = 2654435761 * self->_supportsMatterOwnerCertFetch;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_35;
    goto LABEL_71;
  }
LABEL_70:
  v26 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_35:
    v27 = 2654435761 * self->_supportsa15324f096ec183d;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_36;
LABEL_72:
    v28 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_37;
LABEL_73:
    v29 = 0;
    return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_71:
  v27 = 0;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_72;
LABEL_36:
  v28 = 2654435761 * self->_supports7cbb2355da029df2;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_73;
LABEL_37:
  v29 = 2654435761 * self->_supports946950341b318ffd;
  return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  char *v6;

  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[HMProtoResidentCapabilities setTag:](self, "setTag:");
    v4 = v6;
  }
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x400) != 0)
  {
    self->_supportsCameraRecording = v4[26];
    *(_QWORD *)&self->_has |= 0x400uLL;
    v5 = *(_QWORD *)(v4 + 52);
    if ((v5 & 0x8000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0)
        goto LABEL_6;
      goto LABEL_43;
    }
  }
  else if ((v5 & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  self->_supportsRouterManagement = v4[43];
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  self->_supportsShortcutActions = v4[44];
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x400000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  self->_supportsMediaActions = v4[38];
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  self->_supportsCameraSignificantEventNotifications = v4[28];
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  self->_supportsFirmwareUpdate = v4[33];
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  self->_supportsResidentFirmwareUpdate = v4[41];
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  self->_supportsCameraActivityZones = v4[24];
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x10000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  self->_supportsFaceClassification = v4[32];
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x800000) == 0)
  {
LABEL_13:
    if ((v5 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  self->_supportsNaturalLighting = v4[39];
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x800) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  self->_supportsCameraRecordingReachabilityNotifications = v4[27];
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_15:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  self->_supportsAnnounce = v4[22];
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  self->_supportsWakeOnLAN = v4[49];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  self->_supportsLockNotificationContext = v4[35];
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  self->_supportsWalletKey = v4[50];
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_19:
    if ((v5 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  self->_supportsCameraPackageDetection = v4[25];
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_20:
    if ((v5 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  self->_supportsAccessCodes = v4[21];
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_21:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  self->_supportsCHIP = v4[23];
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  self->_supportsThreadBorderRouter = v4[46];
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  self->_supportsSiriEndpointSetup = v4[45];
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x2000) == 0)
  {
LABEL_24:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  self->_supportsCustomMediaApplicationDestination = v4[29];
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  self->_supportsUnifiedMediaNotifications = v4[48];
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x40000) == 0)
  {
LABEL_26:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  self->_supportsHomeHub = v4[34];
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  self->_supportsResidentFirstAccessoryCommunication = v4[42];
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_28:
    if ((v5 & 1) == 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  self->_supportsThreadNetworkCredentialSharing = v4[47];
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_29:
    if ((v5 & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  self->_supports5348b248a25f84b0c83e = v4[16];
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x8000) == 0)
  {
LABEL_30:
    if ((v5 & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  self->_supportsEventLog = v4[31];
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x200000) == 0)
  {
LABEL_31:
    if ((v5 & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  self->_supportsMatterTTU = v4[37];
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x4000) == 0)
  {
LABEL_32:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  self->_supportsDistributedExecutionOnPrimary = v4[30];
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  self->_supportsResidentActionSetStateEvaluation = v4[40];
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_34:
    if ((v5 & 2) == 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  self->_supports9907491178 = v4[20];
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_35:
    if ((v5 & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  self->_supports6b6244b25f264f02 = v4[17];
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x100000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_74;
  }
LABEL_73:
  self->_supportsMatterOwnerCertFetch = v4[36];
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 4) == 0)
      goto LABEL_38;
LABEL_75:
    self->_supports7cbb2355da029df2 = v4[18];
    *(_QWORD *)&self->_has |= 4uLL;
    if ((*(_QWORD *)(v4 + 52) & 8) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_74:
  self->_supportsa15324f096ec183d = v4[51];
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *(_QWORD *)(v4 + 52);
  if ((v5 & 4) != 0)
    goto LABEL_75;
LABEL_38:
  if ((v5 & 8) != 0)
  {
LABEL_39:
    self->_supports946950341b318ffd = v4[19];
    *(_QWORD *)&self->_has |= 8uLL;
  }
LABEL_40:

}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (BOOL)supportsCameraRecording
{
  return self->_supportsCameraRecording;
}

- (BOOL)supportsRouterManagement
{
  return self->_supportsRouterManagement;
}

- (BOOL)supportsShortcutActions
{
  return self->_supportsShortcutActions;
}

- (BOOL)supportsMediaActions
{
  return self->_supportsMediaActions;
}

- (BOOL)supportsCameraSignificantEventNotifications
{
  return self->_supportsCameraSignificantEventNotifications;
}

- (BOOL)supportsFirmwareUpdate
{
  return self->_supportsFirmwareUpdate;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  return self->_supportsResidentFirmwareUpdate;
}

- (BOOL)supportsCameraActivityZones
{
  return self->_supportsCameraActivityZones;
}

- (BOOL)supportsFaceClassification
{
  return self->_supportsFaceClassification;
}

- (BOOL)supportsNaturalLighting
{
  return self->_supportsNaturalLighting;
}

- (BOOL)supportsCameraRecordingReachabilityNotifications
{
  return self->_supportsCameraRecordingReachabilityNotifications;
}

- (BOOL)supportsAnnounce
{
  return self->_supportsAnnounce;
}

- (BOOL)supportsWakeOnLAN
{
  return self->_supportsWakeOnLAN;
}

- (BOOL)supportsLockNotificationContext
{
  return self->_supportsLockNotificationContext;
}

- (BOOL)supportsWalletKey
{
  return self->_supportsWalletKey;
}

- (BOOL)supportsCameraPackageDetection
{
  return self->_supportsCameraPackageDetection;
}

- (BOOL)supportsAccessCodes
{
  return self->_supportsAccessCodes;
}

- (BOOL)supportsCHIP
{
  return self->_supportsCHIP;
}

- (BOOL)supportsThreadBorderRouter
{
  return self->_supportsThreadBorderRouter;
}

- (BOOL)supportsSiriEndpointSetup
{
  return self->_supportsSiriEndpointSetup;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  return self->_supportsCustomMediaApplicationDestination;
}

- (BOOL)supportsUnifiedMediaNotifications
{
  return self->_supportsUnifiedMediaNotifications;
}

- (BOOL)supportsHomeHub
{
  return self->_supportsHomeHub;
}

- (BOOL)supportsResidentFirstAccessoryCommunication
{
  return self->_supportsResidentFirstAccessoryCommunication;
}

- (BOOL)supportsThreadNetworkCredentialSharing
{
  return self->_supportsThreadNetworkCredentialSharing;
}

- (BOOL)supports5348b248a25f84b0c83e
{
  return self->_supports5348b248a25f84b0c83e;
}

- (BOOL)supportsEventLog
{
  return self->_supportsEventLog;
}

- (BOOL)supportsMatterTTU
{
  return self->_supportsMatterTTU;
}

- (BOOL)supportsDistributedExecutionOnPrimary
{
  return self->_supportsDistributedExecutionOnPrimary;
}

- (BOOL)supportsResidentActionSetStateEvaluation
{
  return self->_supportsResidentActionSetStateEvaluation;
}

- (BOOL)supports9907491178
{
  return self->_supports9907491178;
}

- (BOOL)supports6b6244b25f264f02
{
  return self->_supports6b6244b25f264f02;
}

- (BOOL)supportsMatterOwnerCertFetch
{
  return self->_supportsMatterOwnerCertFetch;
}

- (BOOL)supportsa15324f096ec183d
{
  return self->_supportsa15324f096ec183d;
}

- (BOOL)supports7cbb2355da029df2
{
  return self->_supports7cbb2355da029df2;
}

- (BOOL)supports946950341b318ffd
{
  return self->_supports946950341b318ffd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
