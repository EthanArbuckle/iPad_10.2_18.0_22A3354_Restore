@implementation NRPairedDevice

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  void *v5;
  const char *v6;
  void *v7;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NRPairedDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_storeStrong(v4 + 1, v5);

  -[NRPairedDevice nrDeviceIdentifier](self, "nrDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);

  return v4;
}

- (NRDevicePairingTarget)device
{
  return self->_device;
}

- (NRDeviceIdentifier)nrDeviceIdentifier
{
  return self->_nrDeviceIdentifier;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id)initInternal
{
  NSObject *v1;
  NSObject *v2;
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12.receiver = result;
    v12.super_class = (Class)NRPairedDevice;
    result = objc_msgSendSuper2(&v12, sel_init);
    if (!result)
    {
      v1 = nrCopyLogObj_1090();
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v2 = v1;
        v3 = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);

        if (!v3)
        {
LABEL_9:
          _os_log_pack_size();
          MEMORY[0x1E0C80A78]();
          __error();
          v10 = _os_log_pack_fill();
          *(_DWORD *)v10 = 136446210;
          *(_QWORD *)(v10 + 4) = "-[NRPairedDevice initInternal]";
          v11 = nrCopyLogObj_1090();
          _NRLogAbortWithPack(v11);
        }
      }
      v4 = nrCopyLogObj_1090();
      _NRLogWithArgs((uint64_t)v4, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v5, v6, v7, v8, v9, (uint64_t)");

      goto LABEL_9;
    }
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
