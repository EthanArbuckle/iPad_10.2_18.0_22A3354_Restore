@implementation MTRClusterOtaSoftwareUpdateRequestor

- (MTRClusterOtaSoftwareUpdateRequestor)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRClusterOtaSoftwareUpdateRequestor *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRClusterOtaSoftwareUpdateRequestor *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)announceOtaProviderWithParams:(MTROtaSoftwareUpdateRequestorClusterAnnounceOtaProviderParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
  MEMORY[0x24BEDD108](self, sel_announceOTAProviderWithParams_expectedValues_expectedValueInterval_completion_, params);
}

- (NSDictionary)readAttributeDefaultOtaProvidersWithParams:(MTRReadParams *)params
{
  objc_msgSend_readAttributeDefaultOTAProvidersWithParams_(self, a2, (uint64_t)params);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)writeAttributeDefaultOtaProvidersWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeDefaultOTAProvidersWithValue_expectedValueInterval_, dataValueDictionary);
}

- (void)writeAttributeDefaultOtaProvidersWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeDefaultOTAProvidersWithValue_expectedValueInterval_params_, dataValueDictionary);
}

@end
