@implementation EAAccessoryInternal

- (EAAccessoryInternal)init
{
  EAAccessoryInternal *v3;
  EAAccessoryInternal *v4;
  objc_super v6;

  if (-[EAAccessoryInternal init]::onceToken != -1)
    dispatch_once(&-[EAAccessoryInternal init]::onceToken, &__block_literal_global_0);
  v6.receiver = self;
  v6.super_class = (Class)EAAccessoryInternal;
  v3 = -[EAAccessoryInternal init](&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_connected = 0;
    v3->_connectionID = 0;
    v3->_notPresentInIAPAccessoriesArray = 0;
    v3->_pointOfInterestHandoffEnabled = 0;
    v3->_destinationSharingOptions = 0;
    v3->_enqueuedNMEASentences = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4->_enqueuedNMEATimestamps = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4->_highestXPCDelay = (NSNumber *)&unk_1E6B0E460;
    v4->_highestFrameworkDelay = (NSNumber *)&unk_1E6B0E460;
    v4->_averageXPCDelay = (NSNumber *)&unk_1E6B0E460;
    v4->_averageFrameworkDelay = (NSNumber *)&unk_1E6B0E460;
  }
  return v4;
}

id __27__EAAccessoryInternal_init__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0CB3740]);
  __gLocationLock = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_connected = 0;
  self->_connectionID = 0;

  self->_notPresentInIAPAccessoriesArray = 0;
  v3.receiver = self;
  v3.super_class = (Class)EAAccessoryInternal;
  -[EAAccessoryInternal dealloc](&v3, sel_dealloc);
}

- (void)addSession:(id)a3
{
  NSMutableArray *sessionsList;

  sessionsList = self->_sessionsList;
  if (!sessionsList)
  {
    sessionsList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_sessionsList = sessionsList;
  }
  -[NSMutableArray addObject:](sessionsList, "addObject:", a3);
}

- (void)removeSession:(id)a3
{
  -[NSMutableArray removeObject:](self->_sessionsList, "removeObject:", a3);
  if (!-[NSMutableArray count](self->_sessionsList, "count"))
  {

    self->_sessionsList = 0;
  }
}

- (NSArray)sessionsList
{
  return &self->_sessionsList->super;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (unsigned)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(unsigned int)a3
{
  self->_connectionID = a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)firmwareRevisionActive
{
  return self->_firmwareRevisionActive;
}

- (void)setFirmwareRevisionActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)firmwareRevisionPending
{
  return self->_firmwareRevisionPending;
}

- (void)setFirmwareRevisionPending:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (void)setHardwareRevision:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)dockType
{
  return self->_dockType;
}

- (void)setDockType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)preferredApp
{
  return self->_preferredApp;
}

- (void)setPreferredApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)certSerial
{
  return self->_certSerial;
}

- (void)setCertSerial:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)ppid
{
  return self->_ppid;
}

- (void)setPpid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int)classType
{
  return self->_classType;
}

- (void)setClassType:(int)a3
{
  self->_classType = a3;
}

- (NSDictionary)audioPorts
{
  return self->_audioPorts;
}

- (void)setAudioPorts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned int)a3
{
  self->_capabilities = a3;
}

- (BOOL)notPresentInIAPAccessoriesArray
{
  return self->_notPresentInIAPAccessoriesArray;
}

- (void)setNotPresentInIAPAccessoriesArray:(BOOL)a3
{
  self->_notPresentInIAPAccessoriesArray = a3;
}

- (NSArray)eqNames
{
  return self->_eqNames;
}

- (void)setEqNames:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (unsigned)eqIndex
{
  return self->_eqIndex;
}

- (void)setEqIndex:(unsigned int)a3
{
  self->_eqIndex = a3;
}

- (NSDictionary)vehicleInfoSupportedTypes
{
  return self->_vehicleInfoSupportedTypes;
}

- (void)setVehicleInfoSupportedTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSDictionary)vehicleInfoInitialData
{
  return self->_vehicleInfoInitialData;
}

- (void)setVehicleInfoInitialData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSArray)cameraComponents
{
  return self->_cameraComponents;
}

- (void)setCameraComponents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSDictionary)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSNumber)highestXPCDelay
{
  return self->_highestXPCDelay;
}

- (void)setHighestXPCDelay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NSNumber)highestFrameworkDelay
{
  return self->_highestFrameworkDelay;
}

- (void)setHighestFrameworkDelay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSNumber)averageXPCDelay
{
  return self->_averageXPCDelay;
}

- (void)setAverageXPCDelay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSNumber)averageFrameworkDelay
{
  return self->_averageFrameworkDelay;
}

- (void)setAverageFrameworkDelay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (EAAccessoryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (EAAccessoryDelegate *)a3;
}

- (BOOL)pointOfInterestHandoffEnabled
{
  return self->_pointOfInterestHandoffEnabled;
}

- (void)setPointOfInterestHandoffEnabled:(BOOL)a3
{
  self->_pointOfInterestHandoffEnabled = a3;
}

- (NSMutableArray)enqueuedNMEASentences
{
  return self->_enqueuedNMEASentences;
}

- (void)setEnqueuedNMEASentences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSMutableArray)enqueuedNMEATimestamps
{
  return self->_enqueuedNMEATimestamps;
}

- (void)setEnqueuedNMEATimestamps:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (unint64_t)destinationSharingOptions
{
  return self->_destinationSharingOptions;
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  self->_destinationSharingOptions = a3;
}

- (NSDictionary)protocolDetails
{
  return self->_protocolDetails;
}

- (void)setProtocolDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)coreAccessoryPrimaryUUID
{
  return self->_coreAccessoryPrimaryUUID;
}

- (void)setCoreAccessoryPrimaryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (int)locationSentenceTypesMask
{
  return self->_locationSentenceTypesMask;
}

- (void)setLocationSentenceTypesMask:(int)a3
{
  self->_locationSentenceTypesMask = a3;
}

- (unint64_t)nmeaSentenceAddCounter
{
  return self->_nmeaSentenceAddCounter;
}

- (void)setNmeaSentenceAddCounter:(unint64_t)a3
{
  self->_nmeaSentenceAddCounter = a3;
}

- (unint64_t)nmeaSentenceGetCounter
{
  return self->_nmeaSentenceGetCounter;
}

- (void)setNmeaSentenceGetCounter:(unint64_t)a3
{
  self->_nmeaSentenceGetCounter = a3;
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setBonjourName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)hasIPConnection
{
  return self->_hasIPConnection;
}

- (void)setHasIPConnection:(BOOL)a3
{
  self->_hasIPConnection = a3;
}

- (BOOL)isAvailableOverBonjour
{
  return self->_isAvailableOverBonjour;
}

- (void)setIsAvailableOverBonjour:(BOOL)a3
{
  self->_isAvailableOverBonjour = a3;
}

- (BOOL)createdByCoreAccessories
{
  return self->_createdByCoreAccessories;
}

- (void)setCreatedByCoreAccessories:(BOOL)a3
{
  self->_createdByCoreAccessories = a3;
}

- (id)pairingCompletionBlock
{
  return objc_getProperty(self, a2, 336, 1);
}

- (void)setPairingCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (id)WiFiCredentialsCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setWiFiCredentialsCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

@end
