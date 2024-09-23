@implementation IMRGLog

+ (OS_os_log)registration
{
  if (qword_1ECD90F58 != -1)
    dispatch_once(&qword_1ECD90F58, &unk_1E2C42DA8);
  return (OS_os_log *)(id)qword_1ECD90F50;
}

+ (OS_os_log)timing
{
  if (qword_1ECD90F30 != -1)
    dispatch_once(&qword_1ECD90F30, &unk_1E2C459A0);
  return (OS_os_log *)(id)qword_1ECD90F28;
}

+ (OS_os_log)accountEnabled
{
  if (qword_1ECD90E88 != -1)
    dispatch_once(&qword_1ECD90E88, &unk_1E2C45700);
  return (OS_os_log *)(id)qword_1ECD90E78;
}

+ (OS_os_log)registration_oversized
{
  if (qword_1EE1DD350 != -1)
    dispatch_once(&qword_1EE1DD350, &unk_1E2C43428);
  return (OS_os_log *)(id)qword_1EE1DD348;
}

+ (OS_os_log)warning
{
  if (qword_1ECD90B70 != -1)
    dispatch_once(&qword_1ECD90B70, &unk_1E2C45620);
  return (OS_os_log *)(id)qword_1ECD90B68;
}

+ (OS_os_log)ACKTracker
{
  if (qword_1EE1DDB70 != -1)
    dispatch_once(&qword_1EE1DDB70, &unk_1E2C438A8);
  return (OS_os_log *)(id)qword_1EE1DDB68;
}

+ (OS_os_log)engram
{
  if (qword_1EE1DDB80 != -1)
    dispatch_once(&qword_1EE1DDB80, &unk_1E2C45640);
  return (OS_os_log *)(id)qword_1EE1DDB78;
}

+ (OS_os_log)FTMessageDelivery_oversized
{
  if (qword_1EE1DD1F8 != -1)
    dispatch_once(&qword_1EE1DD1F8, &unk_1E2C45660);
  return (OS_os_log *)(id)qword_1EE1DD1F0;
}

+ (OS_os_log)GDR
{
  if (qword_1EE1DD208 != -1)
    dispatch_once(&qword_1EE1DD208, &unk_1E2C43168);
  return (OS_os_log *)(id)qword_1EE1DD200;
}

+ (OS_os_log)GDR_oversized
{
  if (qword_1EE1DD218 != -1)
    dispatch_once(&qword_1EE1DD218, &unk_1E2C43268);
  return (OS_os_log *)(id)qword_1EE1DD210;
}

+ (OS_os_log)IDSService
{
  if (qword_1EE1DD6B8 != -1)
    dispatch_once(&qword_1EE1DD6B8, &unk_1E2C45680);
  return (OS_os_log *)(id)qword_1EE1DD6D0;
}

+ (OS_os_log)IDSService_oversized
{
  if (qword_1ECD90DD0 != -1)
    dispatch_once(&qword_1ECD90DD0, &unk_1E2C43328);
  return (OS_os_log *)(id)qword_1ECD90DC8;
}

+ (OS_os_log)NRPairing
{
  if (qword_1EE1DD5A8 != -1)
    dispatch_once(&qword_1EE1DD5A8, &unk_1E2C456A0);
  return (OS_os_log *)(id)qword_1EE1DD5A0;
}

+ (OS_os_log)NSUUID
{
  if (qword_1ECD90D08 != -1)
    dispatch_once(&qword_1ECD90D08, &unk_1E2C456C0);
  return (OS_os_log *)(id)qword_1ECD90CE8;
}

+ (OS_os_log)OTRStore
{
  if (qword_1EE1DDB90 != -1)
    dispatch_once(&qword_1EE1DDB90, &unk_1E2C433A8);
  return (OS_os_log *)(id)qword_1EE1DDB88;
}

+ (OS_os_log)accountCleanup
{
  if (qword_1EE1DD4D0 != -1)
    dispatch_once(&qword_1EE1DD4D0, &unk_1E2C456E0);
  return (OS_os_log *)(id)qword_1EE1DD4C8;
}

+ (OS_os_log)accountSync
{
  if (qword_1EE1DD228 != -1)
    dispatch_once(&qword_1EE1DD228, &unk_1E2C434C8);
  return (OS_os_log *)(id)qword_1EE1DD220;
}

+ (OS_os_log)accountUpdate
{
  if (qword_1EE1DD238 != -1)
    dispatch_once(&qword_1EE1DD238, &unk_1E2C43528);
  return (OS_os_log *)(id)qword_1EE1DD230;
}

+ (OS_os_log)accountsDebugging
{
  if (qword_1EE1DD520 != -1)
    dispatch_once(&qword_1EE1DD520, &unk_1E2C45720);
  return (OS_os_log *)(id)qword_1EE1DD518;
}

+ (OS_os_log)activeID
{
  if (qword_1ECD90D20 != -1)
    dispatch_once(&qword_1ECD90D20, &unk_1E2C43568);
  return (OS_os_log *)(id)qword_1ECD90D18;
}

+ (OS_os_log)appleCare
{
  if (qword_1EE1DDBA0 != -1)
    dispatch_once(&qword_1EE1DDBA0, &unk_1E2C435A8);
  return (OS_os_log *)(id)qword_1EE1DDB98;
}

+ (OS_os_log)classKeys
{
  if (qword_1EE1DDBB0 != -1)
    dispatch_once(&qword_1EE1DDBB0, &unk_1E2C43608);
  return (OS_os_log *)(id)qword_1EE1DDBA8;
}

+ (OS_os_log)dataProtectionClass
{
  if (qword_1EE1DD268 != -1)
    dispatch_once(&qword_1EE1DD268, &unk_1E2C43648);
  return (OS_os_log *)(id)qword_1EE1DD260;
}

+ (OS_os_log)deviceHeartbeat
{
  if (qword_1EE1DD278 != -1)
    dispatch_once(&qword_1EE1DD278, &unk_1E2C45740);
  return (OS_os_log *)(id)qword_1EE1DD270;
}

+ (OS_os_log)deviceIDMap
{
  if (qword_1EE1DDBC0 != -1)
    dispatch_once(&qword_1EE1DDBC0, &unk_1E2C45760);
  return (OS_os_log *)(id)qword_1EE1DDBB8;
}

+ (OS_os_log)deviceState
{
  if (qword_1EE1DD288 != -1)
    dispatch_once(&qword_1EE1DD288, &unk_1E2C436C8);
  return (OS_os_log *)(id)qword_1EE1DD280;
}

+ (OS_os_log)healthDebug
{
  if (qword_1EE1DD298 != -1)
    dispatch_once(&qword_1EE1DD298, &unk_1E2C45780);
  return (OS_os_log *)(id)qword_1EE1DD290;
}

+ (OS_os_log)healthDebugging
{
  if (qword_1EE1DD4F0 != -1)
    dispatch_once(&qword_1EE1DD4F0, &unk_1E2C457A0);
  return (OS_os_log *)(id)qword_1EE1DD4E8;
}

+ (OS_os_log)iCloud
{
  if (qword_1EE1DD588 != -1)
    dispatch_once(&qword_1EE1DD588, &unk_1E2C43708);
  return (OS_os_log *)(id)qword_1EE1DD580;
}

+ (OS_os_log)IMMacNotificationCenterManager
{
  if (qword_1EE1DDBD0 != -1)
    dispatch_once(&qword_1EE1DDBD0, &unk_1E2C457C0);
  return (OS_os_log *)(id)qword_1EE1DDBC8;
}

+ (OS_os_log)iMessageSpam
{
  if (qword_1EE1DDBE0 != -1)
    dispatch_once(&qword_1EE1DDBE0, &unk_1E2C457E0);
  return (OS_os_log *)(id)qword_1EE1DDBD8;
}

+ (OS_os_log)spamReporting
{
  if (qword_1EE1DDBF0 != -1)
    dispatch_once(&qword_1EE1DDBF0, &unk_1E2C43788);
  return (OS_os_log *)(id)qword_1EE1DDBE8;
}

+ (OS_os_log)internalCleanup
{
  if (qword_1EE1DD2A8 != -1)
    dispatch_once(&qword_1EE1DD2A8, &unk_1E2C437E8);
  return (OS_os_log *)(id)qword_1EE1DD2A0;
}

+ (OS_os_log)isActive
{
  if (qword_1EE1DDC00 != -1)
    dispatch_once(&qword_1EE1DDC00, &unk_1E2C45800);
  return (OS_os_log *)(id)qword_1EE1DDBF8;
}

+ (OS_os_log)keyRoll
{
  if (qword_1EE1DDC10 != -1)
    dispatch_once(&qword_1EE1DDC10, &unk_1E2C43828);
  return (OS_os_log *)(id)qword_1EE1DDC08;
}

+ (OS_os_log)keychain
{
  if (qword_1EE1DD2E0 != -1)
    dispatch_once(&qword_1EE1DD2E0, &unk_1E2C45820);
  return (OS_os_log *)(id)qword_1EE1DD2D8;
}

+ (OS_os_log)keychainManager
{
  if (qword_1EE1DD8D8 != -1)
    dispatch_once(&qword_1EE1DD8D8, &unk_1E2C45840);
  return (OS_os_log *)(id)qword_1EE1DD8B0;
}

+ (OS_os_log)liveMigration
{
  if (qword_1EE1DD2F0 != -1)
    dispatch_once(&qword_1EE1DD2F0, &unk_1E2C43908);
  return (OS_os_log *)(id)qword_1EE1DD2E8;
}

+ (OS_os_log)messageDelivery_oversized
{
  if (qword_1EE1DD300 != -1)
    dispatch_once(&qword_1EE1DD300, &unk_1E2C45860);
  return (OS_os_log *)(id)qword_1EE1DD2F8;
}

+ (OS_os_log)migration
{
  if (qword_1EE1DD310 != -1)
    dispatch_once(&qword_1EE1DD310, &unk_1E2C45880);
  return (OS_os_log *)(id)qword_1EE1DD308;
}

+ (OS_os_log)nonce
{
  if (qword_1EE1DD6C8 != -1)
    dispatch_once(&qword_1EE1DD6C8, &unk_1E2C43928);
  return (OS_os_log *)(id)qword_1EE1DD6C0;
}

+ (OS_os_log)pairedDeviceRepo
{
  if (qword_1EE1DDC20 != -1)
    dispatch_once(&qword_1EE1DDC20, &unk_1E2C458A0);
  return (OS_os_log *)(id)qword_1EE1DDC18;
}

+ (OS_os_log)pairedIdentities
{
  if (qword_1EE1DDC30 != -1)
    dispatch_once(&qword_1EE1DDC30, &unk_1E2C458C0);
  return (OS_os_log *)(id)qword_1EE1DDC28;
}

+ (OS_os_log)pairing
{
  if (qword_1EE1DDC40 != -1)
    dispatch_once(&qword_1EE1DDC40, &unk_1E2C43988);
  return (OS_os_log *)(id)qword_1EE1DDC38;
}

+ (OS_os_log)pairingIdentities
{
  if (qword_1EE1DDC50 != -1)
    dispatch_once(&qword_1EE1DDC50, &unk_1E2C458E0);
  return (OS_os_log *)(id)qword_1EE1DDC48;
}

+ (OS_os_log)pairingProtocolDebug
{
  if (qword_1EE1DD530 != -1)
    dispatch_once(&qword_1EE1DD530, &unk_1E2C45900);
  return (OS_os_log *)(id)qword_1EE1DD528;
}

+ (OS_os_log)phoneRepair
{
  if (qword_1EE1DD320 != -1)
    dispatch_once(&qword_1EE1DD320, &unk_1E2C439A8);
  return (OS_os_log *)(id)qword_1EE1DD318;
}

+ (OS_os_log)pushToken
{
  if (qword_1EE1DD330 != -1)
    dispatch_once(&qword_1EE1DD330, &unk_1E2C439C8);
  return (OS_os_log *)(id)qword_1EE1DD328;
}

+ (OS_os_log)queryRetry
{
  if (qword_1EE1DDC60 != -1)
    dispatch_once(&qword_1EE1DDC60, &unk_1E2C45920);
  return (OS_os_log *)(id)qword_1EE1DDC58;
}

+ (OS_os_log)regeneration
{
  if (qword_1EE1DDC70 != -1)
    dispatch_once(&qword_1EE1DDC70, &unk_1E2C43A08);
  return (OS_os_log *)(id)qword_1EE1DDC68;
}

+ (OS_os_log)registrationAuthKit
{
  if (qword_1EE1DD4A0 != -1)
    dispatch_once(&qword_1EE1DD4A0, &unk_1E2C43A28);
  return (OS_os_log *)(id)qword_1EE1DD498;
}

+ (OS_os_log)registrationListener
{
  if (qword_1EE1DD340 != -1)
    dispatch_once(&qword_1EE1DD340, &unk_1E2C43068);
  return (OS_os_log *)(id)qword_1EE1DD338;
}

+ (OS_os_log)reloadAccounts
{
  if (qword_1EE1DDC80 != -1)
    dispatch_once(&qword_1EE1DDC80, &unk_1E2C43088);
  return (OS_os_log *)(id)qword_1EE1DDC78;
}

+ (OS_os_log)serverBag
{
  if (qword_1ECD90D40 != -1)
    dispatch_once(&qword_1ECD90D40, &unk_1E2C45940);
  return (OS_os_log *)(id)qword_1ECD90D38;
}

+ (OS_os_log)sms
{
  if (qword_1ECD90CC0 != -1)
    dispatch_once(&qword_1ECD90CC0, &unk_1E2C430A8);
  return (OS_os_log *)(id)qword_1ECD90CB0;
}

+ (OS_os_log)sub_services
{
  if (qword_1EE1DD368 != -1)
    dispatch_once(&qword_1EE1DD368, &unk_1E2C430C8);
  return (OS_os_log *)(id)qword_1EE1DD360;
}

+ (OS_os_log)sysdiagnose_oversized
{
  if (qword_1EE1DD378 != -1)
    dispatch_once(&qword_1EE1DD378, &unk_1E2C45960);
  return (OS_os_log *)(id)qword_1EE1DD370;
}

+ (OS_os_log)sysdiagnose_keyTransparency
{
  if (qword_1EE1DD508 != -1)
    dispatch_once(&qword_1EE1DD508, &unk_1E2C430E8);
  return (OS_os_log *)(id)qword_1EE1DD500;
}

+ (OS_os_log)uniqueID
{
  if (qword_1EE1DDC90 != -1)
    dispatch_once(&qword_1EE1DDC90, &unk_1E2C43108);
  return (OS_os_log *)(id)qword_1EE1DDC88;
}

+ (OS_os_log)voicemailSync
{
  if (qword_1EE1DDCA0 != -1)
    dispatch_once(&qword_1EE1DDCA0, &unk_1E2C45980);
  return (OS_os_log *)(id)qword_1EE1DDC98;
}

+ (OS_os_log)watchPairing
{
  if (qword_1EE1DD658 != -1)
    dispatch_once(&qword_1EE1DD658, &unk_1E2C43128);
  return (OS_os_log *)(id)qword_1EE1DD650;
}

+ (OS_os_log)signInController
{
  if (qword_1EE1DD8E8 != -1)
    dispatch_once(&qword_1EE1DD8E8, &unk_1E2C43148);
  return (OS_os_log *)(id)qword_1EE1DD8E0;
}

+ (OS_os_log)vm
{
  if (qword_1EE1DDCB0 != -1)
    dispatch_once(&qword_1EE1DDCB0, &unk_1E2C459C0);
  return (OS_os_log *)(id)qword_1EE1DDCA8;
}

@end
