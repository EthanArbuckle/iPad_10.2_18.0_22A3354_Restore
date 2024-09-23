@implementation HMProtoAccessoryCapabilities

- (BOOL)hasTag
{
  return self->_tag != 0;
}

- (void)setSupportsKeychainSync:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_supportsKeychainSync = a3;
}

- (void)setHasSupportsKeychainSync:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSupportsKeychainSync
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSupportsDeviceSetup:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_supportsDeviceSetup = a3;
}

- (void)setHasSupportsDeviceSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasSupportsDeviceSetup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSupportsKeyTransferClient:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_supportsKeyTransferClient = a3;
}

- (void)setHasSupportsKeyTransferClient:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSupportsKeyTransferClient
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSupportsKeyTransferServer:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_supportsKeyTransferServer = a3;
}

- (void)setHasSupportsKeyTransferServer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSupportsKeyTransferServer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSupportsStandaloneMode:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_supportsStandaloneMode = a3;
}

- (void)setHasSupportsStandaloneMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSupportsStandaloneMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSupportsCloudDataSync:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_supportsCloudDataSync = a3;
}

- (void)setHasSupportsCloudDataSync:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSupportsCloudDataSync
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setSupportsWholeHouseAudio:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_supportsWholeHouseAudio = a3;
}

- (void)setHasSupportsWholeHouseAudio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSupportsWholeHouseAudio
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setSupportsAssistantAccessControl:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_supportsAssistantAccessControl = a3;
}

- (void)setHasSupportsAssistantAccessControl:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasSupportsAssistantAccessControl
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSupportsHomeInvitation:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_supportsHomeInvitation = a3;
}

- (void)setHasSupportsHomeInvitation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSupportsHomeInvitation
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSupportsTargetControl:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_supportsTargetControl = a3;
}

- (void)setHasSupportsTargetControl:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasSupportsTargetControl
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setSupportsMultiUser:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_supportsMultiUser = a3;
}

- (void)setHasSupportsMultiUser:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSupportsMultiUser
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSupportsHomeLevelLocationServiceSetting:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_supportsHomeLevelLocationServiceSetting = a3;
}

- (void)setHasSupportsHomeLevelLocationServiceSetting:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSupportsHomeLevelLocationServiceSetting
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSupportsHomeLevelAnalyticsAndImprovementSetting:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_supportsHomeLevelAnalyticsAndImprovementSetting = a3;
}

- (void)setHasSupportsHomeLevelAnalyticsAndImprovementSetting:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSupportsHomeLevelAnalyticsAndImprovementSetting
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSupportsCompanionInitiatedRestart:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_supportsCompanionInitiatedRestart = a3;
}

- (void)setHasSupportsCompanionInitiatedRestart:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasSupportsCompanionInitiatedRestart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSupportsMusicAlarm:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_supportsMusicAlarm = a3;
}

- (void)setHasSupportsMusicAlarm:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSupportsMusicAlarm
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSupportsAnnounce:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_supportsAnnounce = a3;
}

- (void)setHasSupportsAnnounce:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSupportsAnnounce
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSupportsf9cc0d9d6aa54e7:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_supportsf9cc0d9d6aa54e7 = a3;
}

- (void)setHasSupportsf9cc0d9d6aa54e7:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsf9cc0d9d6aa54e7
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSupportsThirdPartyMusic:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_supportsThirdPartyMusic = a3;
}

- (void)setHasSupportsThirdPartyMusic:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsThirdPartyMusic
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setSupportsPreferredMediaUser:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_supportsPreferredMediaUser = a3;
}

- (void)setHasSupportsPreferredMediaUser:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSupportsPreferredMediaUser
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSupportsThreadBorderRouter:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_supportsThreadBorderRouter = a3;
}

- (void)setHasSupportsThreadBorderRouter:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsThreadBorderRouter
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setSupportsDoorbellChime:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_supportsDoorbellChime = a3;
}

- (void)setHasSupportsDoorbellChime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasSupportsDoorbellChime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSupportsUserMediaSettings:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_supportsUserMediaSettings = a3;
}

- (void)setHasSupportsUserMediaSettings:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSupportsUserMediaSettings
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setSupportsCoordinationDoorbellChime:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_supportsCoordinationDoorbellChime = a3;
}

- (void)setHasSupportsCoordinationDoorbellChime:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasSupportsCoordinationDoorbellChime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSupportsHomeHub:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_supportsHomeHub = a3;
}

- (void)setHasSupportsHomeHub:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasSupportsHomeHub
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSupportsAudioReturnChannel:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_supportsAudioReturnChannel = a3;
}

- (void)setHasSupportsAudioReturnChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasSupportsAudioReturnChannel
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSupportsManagedConfigurationProfile:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_supportsManagedConfigurationProfile = a3;
}

- (void)setHasSupportsManagedConfigurationProfile:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasSupportsManagedConfigurationProfile
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSupportsCaptiveNetworks:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_supportsCaptiveNetworks = a3;
}

- (void)setHasSupportsCaptiveNetworks:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasSupportsCaptiveNetworks
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSupportsMessagedHomePodSettings:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_supportsMessagedHomePodSettings = a3;
}

- (void)setHasSupportsMessagedHomePodSettings:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSupportsMessagedHomePodSettings
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSupportsMediaActions:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_supportsMediaActions = a3;
}

- (void)setHasSupportsMediaActions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSupportsMediaActions
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSupports90bb069d6bx54e7:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_supports90bb069d6bx54e7 = a3;
}

- (void)setHasSupports90bb069d6bx54e7:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasSupports90bb069d6bx54e7
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSupports89024c1cadcb8b00:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_supports89024c1cadcb8b00 = a3;
}

- (void)setHasSupports89024c1cadcb8b00:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasSupports89024c1cadcb8b00
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupports2c25465bb0b47366:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_supports2c25465bb0b47366 = a3;
}

- (void)setHasSupports2c25465bb0b47366:(BOOL)a3
{
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasSupports2c25465bb0b47366
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSupportsInstallManagedConfigurationProfile:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_supportsInstallManagedConfigurationProfile = a3;
}

- (void)setHasSupportsInstallManagedConfigurationProfile:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSupportsInstallManagedConfigurationProfile
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSupportsCoordinationFreeDoorbellChime:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_supportsCoordinationFreeDoorbellChime = a3;
}

- (void)setHasSupportsCoordinationFreeDoorbellChime:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasSupportsCoordinationFreeDoorbellChime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSupportsCompanionInitiatedObliterate:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_supportsCompanionInitiatedObliterate = a3;
}

- (void)setHasSupportsCompanionInitiatedObliterate:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasSupportsCompanionInitiatedObliterate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSupports45c051b0b1f0:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_supports45c051b0b1f0 = a3;
}

- (void)setHasSupports45c051b0b1f0:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSupports45c051b0b1f0
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportsTVOSUpdateManualUpdateAvailableNotification:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_supportsTVOSUpdateManualUpdateAvailableNotification = a3;
}

- (void)setHasSupportsTVOSUpdateManualUpdateAvailableNotification:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($099FC289130C79FBDEEA212961BAC1CE)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasSupportsTVOSUpdateManualUpdateAvailableNotification
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
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
  v8.super_class = (Class)HMProtoAccessoryCapabilities;
  -[HMProtoAccessoryCapabilities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMProtoAccessoryCapabilities dictionaryRepresentation](self, "dictionaryRepresentation");
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
  $099FC289130C79FBDEEA212961BAC1CE has;
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
  void *v45;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tag = self->_tag;
  if (tag)
    objc_msgSend(v3, "setObject:forKey:", tag, CFSTR("tag"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsKeychainSync);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("supportsKeychainSync"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_6;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsDeviceSetup);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("supportsDeviceSetup"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsKeyTransferClient);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("supportsKeyTransferClient"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsKeyTransferServer);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("supportsKeyTransferServer"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsStandaloneMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("supportsStandaloneMode"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCloudDataSync);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("supportsCloudDataSync"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsWholeHouseAudio);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("supportsWholeHouseAudio"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAssistantAccessControl);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("supportsAssistantAccessControl"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHomeInvitation);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("supportsHomeInvitation"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsTargetControl);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("supportsTargetControl"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMultiUser);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("supportsMultiUser"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHomeLevelLocationServiceSetting);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("supportsHomeLevelLocationServiceSetting"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHomeLevelAnalyticsAndImprovementSetting);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("supportsHomeLevelAnalyticsAndImprovementSetting"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCompanionInitiatedRestart);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("supportsCompanionInitiatedRestart"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMusicAlarm);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("supportsMusicAlarm"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAnnounce);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("supportsAnnounce"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsf9cc0d9d6aa54e7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("supportsf9cc0d9d6aa54e7"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsThirdPartyMusic);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("supportsThirdPartyMusic"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsPreferredMediaUser);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("supportsPreferredMediaUser"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsThreadBorderRouter);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("supportsThreadBorderRouter"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsDoorbellChime);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("supportsDoorbellChime"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsUserMediaSettings);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("supportsUserMediaSettings"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCoordinationDoorbellChime);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("supportsCoordinationDoorbellChime"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsHomeHub);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("supportsHomeHub"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAudioReturnChannel);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("supportsAudioReturnChannel"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsManagedConfigurationProfile);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("supportsManagedConfigurationProfile"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCaptiveNetworks);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("supportsCaptiveNetworks"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMessagedHomePodSettings);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("supportsMessagedHomePodSettings"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMediaActions);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("supportsMediaActions"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports90bb069d6bx54e7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("supports90bb069d6bx54e7"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports89024c1cadcb8b00);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("supports89024c1cadcb8b00"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports2c25465bb0b47366);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("supports2c25465bb0b47366"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInstallManagedConfigurationProfile);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("supportsInstallManagedConfigurationProfile"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCoordinationFreeDoorbellChime);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("supportsCoordinationFreeDoorbellChime"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_39;
LABEL_77:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supports45c051b0b1f0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("supports45c051b0b1f0"));

    if ((*(_QWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCompanionInitiatedObliterate);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("supportsCompanionInitiatedObliterate"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_77;
LABEL_39:
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsTVOSUpdateManualUpdateAvailableNotification);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("supportsTVOSUpdateManualUpdateAvailableNotification"));

  }
LABEL_41:
  v8 = v4;

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return HMProtoAccessoryCapabilitiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $099FC289130C79FBDEEA212961BAC1CE has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_tag)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_6;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_39;
LABEL_77:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_QWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_77;
LABEL_39:
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_40:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_41:

}

- (void)copyTo:(id)a3
{
  id v4;
  $099FC289130C79FBDEEA212961BAC1CE has;
  id v6;

  v4 = a3;
  if (self->_tag)
  {
    v6 = v4;
    objc_msgSend(v4, "setTag:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    *((_BYTE *)v4 + 38) = self->_supportsKeychainSync;
    *((_QWORD *)v4 + 7) |= 0x400000uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_6;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 29) = self->_supportsDeviceSetup;
  *((_QWORD *)v4 + 7) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)v4 + 36) = self->_supportsKeyTransferClient;
  *((_QWORD *)v4 + 7) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *((_BYTE *)v4 + 37) = self->_supportsKeyTransferServer;
  *((_QWORD *)v4 + 7) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *((_BYTE *)v4 + 45) = self->_supportsStandaloneMode;
  *((_QWORD *)v4 + 7) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *((_BYTE *)v4 + 24) = self->_supportsCloudDataSync;
  *((_QWORD *)v4 + 7) |= 0x100uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  *((_BYTE *)v4 + 51) = self->_supportsWholeHouseAudio;
  *((_QWORD *)v4 + 7) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *((_BYTE *)v4 + 21) = self->_supportsAssistantAccessControl;
  *((_QWORD *)v4 + 7) |= 0x20uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *((_BYTE *)v4 + 32) = self->_supportsHomeInvitation;
  *((_QWORD *)v4 + 7) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  *((_BYTE *)v4 + 47) = self->_supportsTargetControl;
  *((_QWORD *)v4 + 7) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  *((_BYTE *)v4 + 42) = self->_supportsMultiUser;
  *((_QWORD *)v4 + 7) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  *((_BYTE *)v4 + 34) = self->_supportsHomeLevelLocationServiceSetting;
  *((_QWORD *)v4 + 7) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)v4 + 33) = self->_supportsHomeLevelAnalyticsAndImprovementSetting;
  *((_QWORD *)v4 + 7) |= 0x20000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)v4 + 26) = self->_supportsCompanionInitiatedRestart;
  *((_QWORD *)v4 + 7) |= 0x400uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)v4 + 43) = self->_supportsMusicAlarm;
  *((_QWORD *)v4 + 7) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  *((_BYTE *)v4 + 20) = self->_supportsAnnounce;
  *((_QWORD *)v4 + 7) |= 0x10uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)v4 + 52) = self->_supportsf9cc0d9d6aa54e7;
  *((_QWORD *)v4 + 7) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  *((_BYTE *)v4 + 48) = self->_supportsThirdPartyMusic;
  *((_QWORD *)v4 + 7) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  *((_BYTE *)v4 + 44) = self->_supportsPreferredMediaUser;
  *((_QWORD *)v4 + 7) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  *((_BYTE *)v4 + 49) = self->_supportsThreadBorderRouter;
  *((_QWORD *)v4 + 7) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  *((_BYTE *)v4 + 30) = self->_supportsDoorbellChime;
  *((_QWORD *)v4 + 7) |= 0x4000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  *((_BYTE *)v4 + 50) = self->_supportsUserMediaSettings;
  *((_QWORD *)v4 + 7) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  *((_BYTE *)v4 + 27) = self->_supportsCoordinationDoorbellChime;
  *((_QWORD *)v4 + 7) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  *((_BYTE *)v4 + 31) = self->_supportsHomeHub;
  *((_QWORD *)v4 + 7) |= 0x8000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  *((_BYTE *)v4 + 22) = self->_supportsAudioReturnChannel;
  *((_QWORD *)v4 + 7) |= 0x40uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  *((_BYTE *)v4 + 39) = self->_supportsManagedConfigurationProfile;
  *((_QWORD *)v4 + 7) |= 0x800000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  *((_BYTE *)v4 + 23) = self->_supportsCaptiveNetworks;
  *((_QWORD *)v4 + 7) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  *((_BYTE *)v4 + 41) = self->_supportsMessagedHomePodSettings;
  *((_QWORD *)v4 + 7) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  *((_BYTE *)v4 + 40) = self->_supportsMediaActions;
  *((_QWORD *)v4 + 7) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  *((_BYTE *)v4 + 19) = self->_supports90bb069d6bx54e7;
  *((_QWORD *)v4 + 7) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  *((_BYTE *)v4 + 18) = self->_supports89024c1cadcb8b00;
  *((_QWORD *)v4 + 7) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  *((_BYTE *)v4 + 16) = self->_supports2c25465bb0b47366;
  *((_QWORD *)v4 + 7) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  *((_BYTE *)v4 + 35) = self->_supportsInstallManagedConfigurationProfile;
  *((_QWORD *)v4 + 7) |= 0x80000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  *((_BYTE *)v4 + 28) = self->_supportsCoordinationFreeDoorbellChime;
  *((_QWORD *)v4 + 7) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_39;
LABEL_77:
    *((_BYTE *)v4 + 17) = self->_supports45c051b0b1f0;
    *((_QWORD *)v4 + 7) |= 2uLL;
    if ((*(_QWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_76:
  *((_BYTE *)v4 + 25) = self->_supportsCompanionInitiatedObliterate;
  *((_QWORD *)v4 + 7) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_77;
LABEL_39:
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_40:
    *((_BYTE *)v4 + 46) = self->_supportsTVOSUpdateManualUpdateAvailableNotification;
    *((_QWORD *)v4 + 7) |= 0x40000000uLL;
  }
LABEL_41:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $099FC289130C79FBDEEA212961BAC1CE has;
  id v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tag, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    *(_BYTE *)(v5 + 38) = self->_supportsKeychainSync;
    *(_QWORD *)(v5 + 56) |= 0x400000uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 29) = self->_supportsDeviceSetup;
  *(_QWORD *)(v5 + 56) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  *(_BYTE *)(v5 + 36) = self->_supportsKeyTransferClient;
  *(_QWORD *)(v5 + 56) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  *(_BYTE *)(v5 + 37) = self->_supportsKeyTransferServer;
  *(_QWORD *)(v5 + 56) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *(_BYTE *)(v5 + 45) = self->_supportsStandaloneMode;
  *(_QWORD *)(v5 + 56) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 24) = self->_supportsCloudDataSync;
  *(_QWORD *)(v5 + 56) |= 0x100uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *(_BYTE *)(v5 + 51) = self->_supportsWholeHouseAudio;
  *(_QWORD *)(v5 + 56) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v5 + 21) = self->_supportsAssistantAccessControl;
  *(_QWORD *)(v5 + 56) |= 0x20uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v5 + 32) = self->_supportsHomeInvitation;
  *(_QWORD *)(v5 + 56) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *(_BYTE *)(v5 + 47) = self->_supportsTargetControl;
  *(_QWORD *)(v5 + 56) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *(_BYTE *)(v5 + 42) = self->_supportsMultiUser;
  *(_QWORD *)(v5 + 56) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  *(_BYTE *)(v5 + 34) = self->_supportsHomeLevelLocationServiceSetting;
  *(_QWORD *)(v5 + 56) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  *(_BYTE *)(v5 + 33) = self->_supportsHomeLevelAnalyticsAndImprovementSetting;
  *(_QWORD *)(v5 + 56) |= 0x20000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  *(_BYTE *)(v5 + 26) = self->_supportsCompanionInitiatedRestart;
  *(_QWORD *)(v5 + 56) |= 0x400uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v5 + 43) = self->_supportsMusicAlarm;
  *(_QWORD *)(v5 + 56) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  *(_BYTE *)(v5 + 20) = self->_supportsAnnounce;
  *(_QWORD *)(v5 + 56) |= 0x10uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  *(_BYTE *)(v5 + 52) = self->_supportsf9cc0d9d6aa54e7;
  *(_QWORD *)(v5 + 56) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  *(_BYTE *)(v5 + 48) = self->_supportsThirdPartyMusic;
  *(_QWORD *)(v5 + 56) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  *(_BYTE *)(v5 + 44) = self->_supportsPreferredMediaUser;
  *(_QWORD *)(v5 + 56) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  *(_BYTE *)(v5 + 49) = self->_supportsThreadBorderRouter;
  *(_QWORD *)(v5 + 56) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  *(_BYTE *)(v5 + 30) = self->_supportsDoorbellChime;
  *(_QWORD *)(v5 + 56) |= 0x4000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  *(_BYTE *)(v5 + 50) = self->_supportsUserMediaSettings;
  *(_QWORD *)(v5 + 56) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v5 + 27) = self->_supportsCoordinationDoorbellChime;
  *(_QWORD *)(v5 + 56) |= 0x800uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v5 + 31) = self->_supportsHomeHub;
  *(_QWORD *)(v5 + 56) |= 0x8000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  *(_BYTE *)(v5 + 22) = self->_supportsAudioReturnChannel;
  *(_QWORD *)(v5 + 56) |= 0x40uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 39) = self->_supportsManagedConfigurationProfile;
  *(_QWORD *)(v5 + 56) |= 0x800000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  *(_BYTE *)(v5 + 23) = self->_supportsCaptiveNetworks;
  *(_QWORD *)(v5 + 56) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 41) = self->_supportsMessagedHomePodSettings;
  *(_QWORD *)(v5 + 56) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v5 + 40) = self->_supportsMediaActions;
  *(_QWORD *)(v5 + 56) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  *(_BYTE *)(v5 + 19) = self->_supports90bb069d6bx54e7;
  *(_QWORD *)(v5 + 56) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  *(_BYTE *)(v5 + 18) = self->_supports89024c1cadcb8b00;
  *(_QWORD *)(v5 + 56) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  *(_BYTE *)(v5 + 16) = self->_supports2c25465bb0b47366;
  *(_QWORD *)(v5 + 56) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  *(_BYTE *)(v5 + 35) = self->_supportsInstallManagedConfigurationProfile;
  *(_QWORD *)(v5 + 56) |= 0x80000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v5 + 28) = self->_supportsCoordinationFreeDoorbellChime;
  *(_QWORD *)(v5 + 56) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_37;
LABEL_75:
    *(_BYTE *)(v5 + 17) = self->_supports45c051b0b1f0;
    *(_QWORD *)(v5 + 56) |= 2uLL;
    if ((*(_QWORD *)&self->_has & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_74:
  *(_BYTE *)(v5 + 25) = self->_supportsCompanionInitiatedObliterate;
  *(_QWORD *)(v5 + 56) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
    goto LABEL_75;
LABEL_37:
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_38:
    *(_BYTE *)(v5 + 46) = self->_supportsTVOSUpdateManualUpdateAvailableNotification;
    *(_QWORD *)(v5 + 56) |= 0x40000000uLL;
  }
LABEL_39:
  v9 = (id)v5;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tag;
  $099FC289130C79FBDEEA212961BAC1CE has;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_295;
  tag = self->_tag;
  if ((unint64_t)tag | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](tag, "isEqual:"))
      goto LABEL_295;
  }
  has = self->_has;
  v7 = *((_QWORD *)v4 + 7);
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0)
      goto LABEL_295;
    if (self->_supportsKeychainSync)
    {
      if (!*((_BYTE *)v4 + 38))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0)
      goto LABEL_295;
    if (self->_supportsDeviceSetup)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0)
      goto LABEL_295;
    if (self->_supportsKeyTransferClient)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0)
      goto LABEL_295;
    if (self->_supportsKeyTransferServer)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0)
      goto LABEL_295;
    if (self->_supportsStandaloneMode)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_295;
    if (self->_supportsCloudDataSync)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0)
      goto LABEL_295;
    if (self->_supportsWholeHouseAudio)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_295;
    if (self->_supportsAssistantAccessControl)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0)
      goto LABEL_295;
    if (self->_supportsHomeInvitation)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0)
      goto LABEL_295;
    if (self->_supportsTargetControl)
    {
      if (!*((_BYTE *)v4 + 47))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 47))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0)
      goto LABEL_295;
    if (self->_supportsMultiUser)
    {
      if (!*((_BYTE *)v4 + 42))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 42))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0)
      goto LABEL_295;
    if (self->_supportsHomeLevelLocationServiceSetting)
    {
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 34))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0)
      goto LABEL_295;
    if (self->_supportsHomeLevelAnalyticsAndImprovementSetting)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0)
      goto LABEL_295;
    if (self->_supportsCompanionInitiatedRestart)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0)
      goto LABEL_295;
    if (self->_supportsMusicAlarm)
    {
      if (!*((_BYTE *)v4 + 43))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_295;
    if (self->_supportsAnnounce)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_295;
    if (self->_supportsf9cc0d9d6aa54e7)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0)
      goto LABEL_295;
    if (self->_supportsThirdPartyMusic)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0)
      goto LABEL_295;
    if (self->_supportsPreferredMediaUser)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0)
      goto LABEL_295;
    if (self->_supportsThreadBorderRouter)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0)
      goto LABEL_295;
    if (self->_supportsDoorbellChime)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0)
      goto LABEL_295;
    if (self->_supportsUserMediaSettings)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0)
      goto LABEL_295;
    if (self->_supportsCoordinationDoorbellChime)
    {
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 27))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0)
      goto LABEL_295;
    if (self->_supportsHomeHub)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_295;
    if (self->_supportsAudioReturnChannel)
    {
      if (!*((_BYTE *)v4 + 22))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 22))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0)
      goto LABEL_295;
    if (self->_supportsManagedConfigurationProfile)
    {
      if (!*((_BYTE *)v4 + 39))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_295;
    if (self->_supportsCaptiveNetworks)
    {
      if (!*((_BYTE *)v4 + 23))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 23))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0)
      goto LABEL_295;
    if (self->_supportsMessagedHomePodSettings)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0)
      goto LABEL_295;
    if (self->_supportsMediaActions)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_295;
    if (self->_supports90bb069d6bx54e7)
    {
      if (!*((_BYTE *)v4 + 19))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0)
      goto LABEL_295;
    if (self->_supports89024c1cadcb8b00)
    {
      if (!*((_BYTE *)v4 + 18))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 18))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_295;
    if (self->_supports2c25465bb0b47366)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0)
      goto LABEL_295;
    if (self->_supportsInstallManagedConfigurationProfile)
    {
      if (!*((_BYTE *)v4 + 35))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 35))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0)
      goto LABEL_295;
    if (self->_supportsCoordinationFreeDoorbellChime)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_295;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_295;
  }
  v8 = *((_QWORD *)v4 + 7);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0)
      goto LABEL_295;
    if (self->_supportsCompanionInitiatedObliterate)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_295;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0)
      goto LABEL_295;
    if (self->_supports45c051b0b1f0)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_295;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) != 0)
    {
      if (self->_supportsTVOSUpdateManualUpdateAvailableNotification)
      {
        if (!*((_BYTE *)v4 + 46))
          goto LABEL_295;
      }
      else if (*((_BYTE *)v4 + 46))
      {
        goto LABEL_295;
      }
      v9 = 1;
      goto LABEL_296;
    }
LABEL_295:
    v9 = 0;
    goto LABEL_296;
  }
  v9 = (*((_QWORD *)v4 + 7) & 0x40000000) == 0;
LABEL_296:

  return v9;
}

- (unint64_t)hash
{
  $099FC289130C79FBDEEA212961BAC1CE has;
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
  uint64_t v41;
  NSUInteger v42;

  v42 = -[NSString hash](self->_tag, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    v41 = 2654435761 * self->_supportsKeychainSync;
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
LABEL_3:
      v40 = 2654435761 * self->_supportsDeviceSetup;
      if ((*(_DWORD *)&has & 0x100000) != 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else
  {
    v41 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_3;
  }
  v40 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    v39 = 2654435761 * self->_supportsKeyTransferClient;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  v39 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_5:
    v38 = 2654435761 * self->_supportsKeyTransferServer;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_42:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_6:
    v37 = 2654435761 * self->_supportsStandaloneMode;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_44;
  }
LABEL_43:
  v37 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    v36 = 2654435761 * self->_supportsCloudDataSync;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_8;
    goto LABEL_45;
  }
LABEL_44:
  v36 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_8:
    v35 = 2654435761 * self->_supportsWholeHouseAudio;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_46;
  }
LABEL_45:
  v35 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_9:
    v34 = 2654435761 * self->_supportsAssistantAccessControl;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    v33 = 2654435761 * self->_supportsHomeInvitation;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_11:
    v32 = 2654435761 * self->_supportsTargetControl;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_12:
    v31 = 2654435761 * self->_supportsMultiUser;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    v4 = 2654435761 * self->_supportsHomeLevelLocationServiceSetting;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_14:
    v5 = 2654435761 * self->_supportsHomeLevelAnalyticsAndImprovementSetting;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  v5 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_15:
    v6 = 2654435761 * self->_supportsCompanionInitiatedRestart;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_16:
    v7 = 2654435761 * self->_supportsMusicAlarm;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_17:
    v8 = 2654435761 * self->_supportsAnnounce;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  v8 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_18:
    v9 = 2654435761 * self->_supportsf9cc0d9d6aa54e7;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  v9 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_19:
    v10 = 2654435761 * self->_supportsThirdPartyMusic;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_20;
    goto LABEL_57;
  }
LABEL_56:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_20:
    v11 = 2654435761 * self->_supportsPreferredMediaUser;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_21;
    goto LABEL_58;
  }
LABEL_57:
  v11 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_21:
    v12 = 2654435761 * self->_supportsThreadBorderRouter;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_22;
    goto LABEL_59;
  }
LABEL_58:
  v12 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_22:
    v13 = 2654435761 * self->_supportsDoorbellChime;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_23;
    goto LABEL_60;
  }
LABEL_59:
  v13 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_23:
    v14 = 2654435761 * self->_supportsUserMediaSettings;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_24;
    goto LABEL_61;
  }
LABEL_60:
  v14 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_24:
    v15 = 2654435761 * self->_supportsCoordinationDoorbellChime;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_25;
    goto LABEL_62;
  }
LABEL_61:
  v15 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_25:
    v16 = 2654435761 * self->_supportsHomeHub;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_26:
    v17 = 2654435761 * self->_supportsAudioReturnChannel;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_27:
    v18 = 2654435761 * self->_supportsManagedConfigurationProfile;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_28:
    v19 = 2654435761 * self->_supportsCaptiveNetworks;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_29;
    goto LABEL_66;
  }
LABEL_65:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_29:
    v20 = 2654435761 * self->_supportsMessagedHomePodSettings;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_30;
    goto LABEL_67;
  }
LABEL_66:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_30:
    v21 = 2654435761 * self->_supportsMediaActions;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_31;
    goto LABEL_68;
  }
LABEL_67:
  v21 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_31:
    v22 = 2654435761 * self->_supports90bb069d6bx54e7;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_32;
    goto LABEL_69;
  }
LABEL_68:
  v22 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_32:
    v23 = 2654435761 * self->_supports89024c1cadcb8b00;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_69:
  v23 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_33:
    v24 = 2654435761 * self->_supports2c25465bb0b47366;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_34;
    goto LABEL_71;
  }
LABEL_70:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_34:
    v25 = 2654435761 * self->_supportsInstallManagedConfigurationProfile;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_35;
    goto LABEL_72;
  }
LABEL_71:
  v25 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_35:
    v26 = 2654435761 * self->_supportsCoordinationFreeDoorbellChime;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_36;
    goto LABEL_73;
  }
LABEL_72:
  v26 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_36:
    v27 = 2654435761 * self->_supportsCompanionInitiatedObliterate;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_37;
LABEL_74:
    v28 = 0;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_38;
LABEL_75:
    v29 = 0;
    return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_73:
  v27 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_74;
LABEL_37:
  v28 = 2654435761 * self->_supports45c051b0b1f0;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
    goto LABEL_75;
LABEL_38:
  v29 = 2654435761 * self->_supportsTVOSUpdateManualUpdateAvailableNotification;
  return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  uint64_t v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[HMProtoAccessoryCapabilities setTag:](self, "setTag:");
    v4 = v6;
  }
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x400000) != 0)
  {
    self->_supportsKeychainSync = v4[38];
    *(_QWORD *)&self->_has |= 0x400000uLL;
    v5 = *((_QWORD *)v4 + 7);
    if ((v5 & 0x2000) == 0)
    {
LABEL_5:
      if ((v5 & 0x100000) == 0)
        goto LABEL_6;
      goto LABEL_44;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  self->_supportsDeviceSetup = v4[29];
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x100000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  self->_supportsKeyTransferClient = v4[36];
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x200000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  self->_supportsKeyTransferServer = v4[37];
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  self->_supportsStandaloneMode = v4[45];
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  self->_supportsCloudDataSync = v4[24];
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  self->_supportsWholeHouseAudio = v4[51];
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  self->_supportsAssistantAccessControl = v4[21];
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x10000) == 0)
  {
LABEL_12:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  self->_supportsHomeInvitation = v4[32];
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  self->_supportsTargetControl = v4[47];
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  self->_supportsMultiUser = v4[42];
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  self->_supportsHomeLevelLocationServiceSetting = v4[34];
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  self->_supportsHomeLevelAnalyticsAndImprovementSetting = v4[33];
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x400) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  self->_supportsCompanionInitiatedRestart = v4[26];
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  self->_supportsMusicAlarm = v4[43];
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x10) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  self->_supportsAnnounce = v4[20];
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  self->_supportsf9cc0d9d6aa54e7 = v4[52];
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  self->_supportsThirdPartyMusic = v4[48];
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  self->_supportsPreferredMediaUser = v4[44];
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  self->_supportsThreadBorderRouter = v4[49];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  self->_supportsDoorbellChime = v4[30];
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  self->_supportsUserMediaSettings = v4[50];
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x800) == 0)
  {
LABEL_26:
    if ((v5 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  self->_supportsCoordinationDoorbellChime = v4[27];
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x8000) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_66;
  }
LABEL_65:
  self->_supportsHomeHub = v4[31];
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_67;
  }
LABEL_66:
  self->_supportsAudioReturnChannel = v4[22];
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x800000) == 0)
  {
LABEL_29:
    if ((v5 & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_68;
  }
LABEL_67:
  self->_supportsManagedConfigurationProfile = v4[39];
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x80) == 0)
  {
LABEL_30:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_69;
  }
LABEL_68:
  self->_supportsCaptiveNetworks = v4[23];
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_69:
  self->_supportsMessagedHomePodSettings = v4[41];
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v5 & 8) == 0)
      goto LABEL_33;
    goto LABEL_71;
  }
LABEL_70:
  self->_supportsMediaActions = v4[40];
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 8) == 0)
  {
LABEL_33:
    if ((v5 & 4) == 0)
      goto LABEL_34;
    goto LABEL_72;
  }
LABEL_71:
  self->_supports90bb069d6bx54e7 = v4[19];
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 4) == 0)
  {
LABEL_34:
    if ((v5 & 1) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  self->_supports89024c1cadcb8b00 = v4[18];
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 1) == 0)
  {
LABEL_35:
    if ((v5 & 0x80000) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  self->_supports2c25465bb0b47366 = v4[16];
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x80000) == 0)
  {
LABEL_36:
    if ((v5 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  self->_supportsInstallManagedConfigurationProfile = v4[35];
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x1000) == 0)
  {
LABEL_37:
    if ((v5 & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  self->_supportsCoordinationFreeDoorbellChime = v4[28];
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 0x200) == 0)
  {
LABEL_38:
    if ((v5 & 2) == 0)
      goto LABEL_39;
LABEL_77:
    self->_supports45c051b0b1f0 = v4[17];
    *(_QWORD *)&self->_has |= 2uLL;
    if ((*((_QWORD *)v4 + 7) & 0x40000000) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_76:
  self->_supportsCompanionInitiatedObliterate = v4[25];
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)v4 + 7);
  if ((v5 & 2) != 0)
    goto LABEL_77;
LABEL_39:
  if ((v5 & 0x40000000) != 0)
  {
LABEL_40:
    self->_supportsTVOSUpdateManualUpdateAvailableNotification = v4[46];
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
LABEL_41:

}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (BOOL)supportsKeychainSync
{
  return self->_supportsKeychainSync;
}

- (BOOL)supportsDeviceSetup
{
  return self->_supportsDeviceSetup;
}

- (BOOL)supportsKeyTransferClient
{
  return self->_supportsKeyTransferClient;
}

- (BOOL)supportsKeyTransferServer
{
  return self->_supportsKeyTransferServer;
}

- (BOOL)supportsStandaloneMode
{
  return self->_supportsStandaloneMode;
}

- (BOOL)supportsCloudDataSync
{
  return self->_supportsCloudDataSync;
}

- (BOOL)supportsWholeHouseAudio
{
  return self->_supportsWholeHouseAudio;
}

- (BOOL)supportsAssistantAccessControl
{
  return self->_supportsAssistantAccessControl;
}

- (BOOL)supportsHomeInvitation
{
  return self->_supportsHomeInvitation;
}

- (BOOL)supportsTargetControl
{
  return self->_supportsTargetControl;
}

- (BOOL)supportsMultiUser
{
  return self->_supportsMultiUser;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return self->_supportsHomeLevelLocationServiceSetting;
}

- (BOOL)supportsHomeLevelAnalyticsAndImprovementSetting
{
  return self->_supportsHomeLevelAnalyticsAndImprovementSetting;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  return self->_supportsCompanionInitiatedRestart;
}

- (BOOL)supportsMusicAlarm
{
  return self->_supportsMusicAlarm;
}

- (BOOL)supportsAnnounce
{
  return self->_supportsAnnounce;
}

- (BOOL)supportsf9cc0d9d6aa54e7
{
  return self->_supportsf9cc0d9d6aa54e7;
}

- (BOOL)supportsThirdPartyMusic
{
  return self->_supportsThirdPartyMusic;
}

- (BOOL)supportsPreferredMediaUser
{
  return self->_supportsPreferredMediaUser;
}

- (BOOL)supportsThreadBorderRouter
{
  return self->_supportsThreadBorderRouter;
}

- (BOOL)supportsDoorbellChime
{
  return self->_supportsDoorbellChime;
}

- (BOOL)supportsUserMediaSettings
{
  return self->_supportsUserMediaSettings;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  return self->_supportsCoordinationDoorbellChime;
}

- (BOOL)supportsHomeHub
{
  return self->_supportsHomeHub;
}

- (BOOL)supportsAudioReturnChannel
{
  return self->_supportsAudioReturnChannel;
}

- (BOOL)supportsManagedConfigurationProfile
{
  return self->_supportsManagedConfigurationProfile;
}

- (BOOL)supportsCaptiveNetworks
{
  return self->_supportsCaptiveNetworks;
}

- (BOOL)supportsMessagedHomePodSettings
{
  return self->_supportsMessagedHomePodSettings;
}

- (BOOL)supportsMediaActions
{
  return self->_supportsMediaActions;
}

- (BOOL)supports90bb069d6bx54e7
{
  return self->_supports90bb069d6bx54e7;
}

- (BOOL)supports89024c1cadcb8b00
{
  return self->_supports89024c1cadcb8b00;
}

- (BOOL)supports2c25465bb0b47366
{
  return self->_supports2c25465bb0b47366;
}

- (BOOL)supportsInstallManagedConfigurationProfile
{
  return self->_supportsInstallManagedConfigurationProfile;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  return self->_supportsCoordinationFreeDoorbellChime;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  return self->_supportsCompanionInitiatedObliterate;
}

- (BOOL)supports45c051b0b1f0
{
  return self->_supports45c051b0b1f0;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  return self->_supportsTVOSUpdateManualUpdateAvailableNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
