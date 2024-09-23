@implementation IDSFoundationLog

+ (OS_os_log)delivery
{
  if (qword_1EE40AAA0 != -1)
    dispatch_once(&qword_1EE40AAA0, &unk_1E3C1BC50);
  return (OS_os_log *)(id)qword_1EE40AA98;
}

+ (OS_os_log)Multiplexer
{
  if (qword_1EE40A9E8 != -1)
    dispatch_once(&qword_1EE40A9E8, &unk_1E3C21768);
  return (OS_os_log *)(id)qword_1EE40A9E0;
}

+ (OS_os_log)cloudKit
{
  if (qword_1EE40B278 != -1)
    dispatch_once(&qword_1EE40B278, &unk_1E3C1B8D0);
  return (OS_os_log *)(id)qword_1EE40B270;
}

+ (OS_os_log)accountIdentity
{
  if (qword_1EE40AA90 != -1)
    dispatch_once(&qword_1EE40AA90, &unk_1E3C21448);
  return (OS_os_log *)(id)qword_1EE40AA88;
}

+ (OS_os_log)groupCrypto
{
  if (qword_1EE40B288 != -1)
    dispatch_once(&qword_1EE40B288, &unk_1E3C21468);
  return (OS_os_log *)(id)qword_1EE40B280;
}

+ (OS_os_log)delivery_oversized
{
  if (qword_1EE40AAB0 != -1)
    dispatch_once(&qword_1EE40AAB0, &unk_1E3C21488);
  return (OS_os_log *)(id)qword_1EE40AAA8;
}

+ (OS_os_log)delivery_keyTransparency
{
  if (qword_1EE40ADC8 != -1)
    dispatch_once(&qword_1EE40ADC8, &unk_1E3C214A8);
  return (OS_os_log *)(id)qword_1EE40ADC0;
}

+ (OS_os_log)query
{
  if (qword_1EE40B298 != -1)
    dispatch_once(&qword_1EE40B298, &unk_1E3C1BD30);
  return (OS_os_log *)(id)qword_1EE40B290;
}

+ (OS_os_log)UTunPeer
{
  if (qword_1EE40AE68 != -1)
    dispatch_once(&qword_1EE40AE68, &unk_1E3C1BD50);
  return (OS_os_log *)(id)qword_1EE40AE60;
}

+ (OS_os_log)UTunConnection
{
  if (qword_1EE40AA08 != -1)
    dispatch_once(&qword_1EE40AA08, &unk_1E3C214C8);
  return (OS_os_log *)(id)qword_1EE40AA00;
}

+ (OS_os_log)localDeliveryQueue
{
  if (qword_1EE40B2A8 != -1)
    dispatch_once(&qword_1EE40B2A8, &unk_1E3C1BD70);
  return (OS_os_log *)(id)qword_1EE40B2A0;
}

+ (OS_os_log)socketPairConnection
{
  if (qword_1EE40AEE0 != -1)
    dispatch_once(&qword_1EE40AEE0, &unk_1E3C214E8);
  return (OS_os_log *)(id)qword_1EE40AED8;
}

+ (OS_os_log)OTRController
{
  if (qword_1EE40B2B8 != -1)
    dispatch_once(&qword_1EE40B2B8, &unk_1E3C21508);
  return (OS_os_log *)(id)qword_1EE40B2B0;
}

+ (OS_os_log)encryptionController
{
  if (qword_1EE40B2C8 != -1)
    dispatch_once(&qword_1EE40B2C8, &unk_1E3C1BDF0);
  return (OS_os_log *)(id)qword_1EE40B2C0;
}

+ (OS_os_log)BTLink
{
  if (qword_1EE40B2D8 != -1)
    dispatch_once(&qword_1EE40B2D8, &unk_1E3C21528);
  return (OS_os_log *)(id)qword_1EE40B2D0;
}

+ (OS_os_log)utunController
{
  if (qword_1EE40AC70 != -1)
    dispatch_once(&qword_1EE40AC70, &unk_1E3C1BE50);
  return (OS_os_log *)(id)qword_1EE40AC68;
}

+ (OS_os_log)deliveryController
{
  if (qword_1EE40B2E8 != -1)
    dispatch_once(&qword_1EE40B2E8, &unk_1E3C1BEB0);
  return (OS_os_log *)(id)qword_1EE40B2E0;
}

+ (OS_os_log)stewieProvisioning
{
  if (qword_1EE40AD98 != -1)
    dispatch_once(&qword_1EE40AD98, &unk_1E3C21548);
  return (OS_os_log *)(id)qword_1EE40AD90;
}

+ (OS_os_log)stewieMessaging
{
  if (qword_1EE40AD88 != -1)
    dispatch_once(&qword_1EE40AD88, &unk_1E3C21568);
  return (OS_os_log *)(id)qword_1EE40AD80;
}

+ (OS_os_log)IDSOffGridMessenger
{
  if (qword_1EE40AF08 != -1)
    dispatch_once(&qword_1EE40AF08, &unk_1E3C1BEF0);
  return (OS_os_log *)(id)qword_1EE40AF00;
}

+ (OS_os_log)IDSOffGridStateManager
{
  if (qword_1EE40AF80 != -1)
    dispatch_once(&qword_1EE40AF80, &unk_1E3C21588);
  return (OS_os_log *)(id)qword_1EE40AF78;
}

+ (OS_os_log)IDSOffGridStateManager_oversized
{
  if (qword_1EE40ADA8 != -1)
    dispatch_once(&qword_1EE40ADA8, &unk_1E3C215A8);
  return (OS_os_log *)(id)qword_1EE40ADA0;
}

+ (OS_os_log)IDSSKStatusClient
{
  if (qword_1EE40AD48 != -1)
    dispatch_once(&qword_1EE40AD48, &unk_1E3C1BF50);
  return (OS_os_log *)(id)qword_1EE40AD40;
}

+ (OS_os_log)opportunistic
{
  if (qword_1EE40AC88 != -1)
    dispatch_once(&qword_1EE40AC88, &unk_1E3C1BF70);
  return (OS_os_log *)(id)qword_1EE40ACB0;
}

+ (OS_os_log)bonjourDeliveryController
{
  if (qword_1EE40B2F8 != -1)
    dispatch_once(&qword_1EE40B2F8, &unk_1E3C1BF90);
  return (OS_os_log *)(id)qword_1EE40B2F0;
}

+ (OS_os_log)utilities
{
  if (qword_1ECDD47F0 != -1)
    dispatch_once(&qword_1ECDD47F0, &unk_1E3C1BFB0);
  return (OS_os_log *)(id)qword_1ECDD47E8;
}

+ (OS_os_log)IPsecLink
{
  if (qword_1EE40B308 != -1)
    dispatch_once(&qword_1EE40B308, &unk_1E3C215C8);
  return (OS_os_log *)(id)qword_1EE40B300;
}

+ (OS_os_log)xpc
{
  if (qword_1ECDD4880 != -1)
    dispatch_once(&qword_1ECDD4880, &unk_1E3C215E8);
  return (OS_os_log *)(id)qword_1ECDD4878;
}

+ (OS_os_log)IDSSession
{
  if (qword_1EE40B318 != -1)
    dispatch_once(&qword_1EE40B318, &unk_1E3C1BFD0);
  return (OS_os_log *)(id)qword_1EE40B310;
}

+ (OS_os_log)IDSDSession
{
  if (qword_1EE40B328 != -1)
    dispatch_once(&qword_1EE40B328, &unk_1E3C21608);
  return (OS_os_log *)(id)qword_1EE40B320;
}

+ (OS_os_log)GroupStatus_oversized
{
  if (qword_1EE40B338 != -1)
    dispatch_once(&qword_1EE40B338, &unk_1E3C21628);
  return (OS_os_log *)(id)qword_1EE40B330;
}

+ (OS_os_log)QRAllocator
{
  if (qword_1EE40A9F8 != -1)
    dispatch_once(&qword_1EE40A9F8, &unk_1E3C1C030);
  return (OS_os_log *)(id)qword_1EE40A9F0;
}

+ (OS_os_log)QRAllocator_oversized
{
  if (qword_1EE40AE38 != -1)
    dispatch_once(&qword_1EE40AE38, &unk_1E3C21648);
  return (OS_os_log *)(id)qword_1EE40AE30;
}

+ (OS_os_log)Stun
{
  if (qword_1EE40AE58 != -1)
    dispatch_once(&qword_1EE40AE58, &unk_1E3C1C090);
  return (OS_os_log *)(id)qword_1EE40AE50;
}

+ (OS_os_log)ServerMaterialExchange
{
  if (qword_1EE40B348 != -1)
    dispatch_once(&qword_1EE40B348, &unk_1E3C1C0B0);
  return (OS_os_log *)(id)qword_1EE40B340;
}

+ (OS_os_log)ServerMaterialExchange_oversize
{
  if (qword_1EE40B358 != -1)
    dispatch_once(&qword_1EE40B358, &unk_1E3C1C0D0);
  return (OS_os_log *)(id)qword_1EE40B350;
}

+ (OS_os_log)Metrics
{
  if (qword_1EE40B368 != -1)
    dispatch_once(&qword_1EE40B368, &unk_1E3C21668);
  return (OS_os_log *)(id)qword_1EE40B360;
}

+ (OS_os_log)GlobalLink
{
  if (qword_1EE40ADE8 != -1)
    dispatch_once(&qword_1EE40ADE8, &unk_1E3C1C150);
  return (OS_os_log *)(id)qword_1EE40ADE0;
}

+ (OS_os_log)GlobalLink_oversize
{
  if (qword_1EE40ADF8 != -1)
    dispatch_once(&qword_1EE40ADF8, &unk_1E3C1C1D0);
  return (OS_os_log *)(id)qword_1EE40ADF0;
}

+ (OS_os_log)FTGL
{
  if (qword_1EE40B378 != -1)
    dispatch_once(&qword_1EE40B378, &unk_1E3C21688);
  return (OS_os_log *)(id)qword_1EE40B370;
}

+ (OS_os_log)GFTGL
{
  if (qword_1EE40B388 != -1)
    dispatch_once(&qword_1EE40B388, &unk_1E3C1C250);
  return (OS_os_log *)(id)qword_1EE40B380;
}

+ (OS_os_log)NonFTGL
{
  if (qword_1EE40AE28 != -1)
    dispatch_once(&qword_1EE40AE28, &unk_1E3C1C290);
  return (OS_os_log *)(id)qword_1EE40AE20;
}

+ (OS_os_log)SessionController
{
  if (qword_1EE40B398 != -1)
    dispatch_once(&qword_1EE40B398, &unk_1E3C216A8);
  return (OS_os_log *)(id)qword_1EE40B390;
}

+ (OS_os_log)RealTimeEncryptionController
{
  if (qword_1EE40B3A8 != -1)
    dispatch_once(&qword_1EE40B3A8, &unk_1E3C1C2D0);
  return (OS_os_log *)(id)qword_1EE40B3A0;
}

+ (OS_os_log)RealTimeEncryptionController_oversize
{
  if (qword_1EE40B3B8 != -1)
    dispatch_once(&qword_1EE40B3B8, &unk_1E3C1C2F0);
  return (OS_os_log *)(id)qword_1EE40B3B0;
}

+ (OS_os_log)StableEncryptionController
{
  if (qword_1EE40B3C8 != -1)
    dispatch_once(&qword_1EE40B3C8, &unk_1E3C216C8);
  return (OS_os_log *)(id)qword_1EE40B3C0;
}

+ (OS_os_log)GroupSessionDataCryptor
{
  if (qword_1EE40B3D8 != -1)
    dispatch_once(&qword_1EE40B3D8, &unk_1E3C1BAB0);
  return (OS_os_log *)(id)qword_1EE40B3D0;
}

+ (OS_os_log)IDSMessageStore
{
  if (qword_1EE40A9D8 != -1)
    dispatch_once(&qword_1EE40A9D8, &unk_1E3C1BAD0);
  return (OS_os_log *)(id)qword_1EE40A9D0;
}

+ (OS_os_log)KeyTransparency
{
  if (qword_1EE40AEF0 != -1)
    dispatch_once(&qword_1EE40AEF0, &unk_1E3C1B5B0);
  return (OS_os_log *)(id)qword_1EE40AEE8;
}

+ (OS_os_log)FeatureToggler
{
  if (qword_1EE40B3E8 != -1)
    dispatch_once(&qword_1EE40B3E8, &unk_1E3C1BAF0);
  return (OS_os_log *)(id)qword_1EE40B3E0;
}

+ (OS_os_log)CrossLayerLogging
{
  if (qword_1ECDD4868 != -1)
    dispatch_once(&qword_1ECDD4868, &unk_1E3C1BB10);
  return (OS_os_log *)(id)qword_1ECDD4860;
}

+ (OS_os_log)IDSUDPLink
{
  if (qword_1EE40B3F8 != -1)
    dispatch_once(&qword_1EE40B3F8, &unk_1E3C1BB30);
  return (OS_os_log *)(id)qword_1EE40B3F0;
}

+ (OS_os_log)IDSNWLink
{
  if (qword_1EE40AE08 != -1)
    dispatch_once(&qword_1EE40AE08, &unk_1E3C216E8);
  return (OS_os_log *)(id)qword_1EE40AE00;
}

+ (OS_os_log)QRProto
{
  if (qword_1EE40B408 != -1)
    dispatch_once(&qword_1EE40B408, &unk_1E3C1BB70);
  return (OS_os_log *)(id)qword_1EE40B400;
}

+ (OS_os_log)QRProto_oversize
{
  if (qword_1EE40AE48 != -1)
    dispatch_once(&qword_1EE40AE48, &unk_1E3C21708);
  return (OS_os_log *)(id)qword_1EE40AE40;
}

+ (OS_os_log)interface
{
  if (qword_1EE40B418 != -1)
    dispatch_once(&qword_1EE40B418, &unk_1E3C21728);
  return (OS_os_log *)(id)qword_1EE40B410;
}

+ (OS_os_log)ConnectivityMonitor
{
  if (qword_1EE40B428 != -1)
    dispatch_once(&qword_1EE40B428, &unk_1E3C1BB90);
  return (OS_os_log *)(id)qword_1EE40B420;
}

+ (OS_os_log)TransportLevelAgent
{
  if (qword_1EE40ACF0 != -1)
    dispatch_once(&qword_1EE40ACF0, &unk_1E3C21748);
  return (OS_os_log *)(id)qword_1EE40ACE8;
}

+ (OS_os_log)IDSServerMessaging
{
  if (qword_1EE40B438 != -1)
    dispatch_once(&qword_1EE40B438, &unk_1E3C1BBB0);
  return (OS_os_log *)(id)qword_1EE40B430;
}

+ (OS_os_log)ClientChannel
{
  if (qword_1EE40B448 != -1)
    dispatch_once(&qword_1EE40B448, &unk_1E3C21788);
  return (OS_os_log *)(id)qword_1EE40B440;
}

+ (OS_os_log)ClientChannelAgent
{
  if (qword_1EE40B458 != -1)
    dispatch_once(&qword_1EE40B458, &unk_1E3C217A8);
  return (OS_os_log *)(id)qword_1EE40B450;
}

+ (OS_os_log)ClientChannelManager
{
  if (qword_1EE40ACC0 != -1)
    dispatch_once(&qword_1EE40ACC0, &unk_1E3C1BBD0);
  return (OS_os_log *)(id)qword_1EE40ACB8;
}

+ (OS_os_log)IDSFirewall
{
  if (qword_1EE40AD18 != -1)
    dispatch_once(&qword_1EE40AD18, &unk_1E3C217C8);
  return (OS_os_log *)(id)qword_1EE40AD10;
}

+ (OS_os_log)NWPathUtils
{
  if (qword_1EE40B468 != -1)
    dispatch_once(&qword_1EE40B468, &unk_1E3C217E8);
  return (OS_os_log *)(id)qword_1EE40B460;
}

+ (OS_os_log)GroupSessionKeyValueDelivery
{
  if (qword_1EE40B478 != -1)
    dispatch_once(&qword_1EE40B478, &unk_1E3C1BBF0);
  return (OS_os_log *)(id)qword_1EE40B470;
}

+ (OS_os_log)System
{
  if (qword_1EE40B488 != -1)
    dispatch_once(&qword_1EE40B488, &unk_1E3C21808);
  return (OS_os_log *)(id)qword_1EE40B480;
}

+ (OS_os_log)SimulatorProxy
{
  if (qword_1EE40B498 != -1)
    dispatch_once(&qword_1EE40B498, &unk_1E3C21828);
  return (OS_os_log *)(id)qword_1EE40B490;
}

+ (OS_os_log)ContactsUtilities
{
  if (qword_1EE40ADD8 != -1)
    dispatch_once(&qword_1EE40ADD8, &unk_1E3C1BC10);
  return (OS_os_log *)(id)qword_1EE40ADD0;
}

+ (OS_os_log)IDSPinnedIdentity
{
  if (qword_1EE40AF18 != -1)
    dispatch_once(&qword_1EE40AF18, &unk_1E3C21848);
  return (OS_os_log *)(id)qword_1EE40AF10;
}

+ (OS_os_log)PeerLookup_DBCache
{
  if (qword_1EE40ADB8 != -1)
    dispatch_once(&qword_1EE40ADB8, &unk_1E3C21868);
  return (OS_os_log *)(id)qword_1EE40ADB0;
}

@end
