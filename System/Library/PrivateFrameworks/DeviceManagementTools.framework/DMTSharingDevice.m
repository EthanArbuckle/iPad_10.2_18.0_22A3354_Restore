@implementation DMTSharingDevice

- (DMTSharingDevice)initWithDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  unint64_t v11;
  void *v12;
  DMTSharingDevice *v13;
  objc_super v15;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bleDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rssi");
  v10 = +[DMTSharingDevice deviceIsPairedAccordingToFlags:](DMTSharingDevice, "deviceIsPairedAccordingToFlags:", objc_msgSend(v5, "deviceFlags"));
  v11 = +[DMTSharingDevice devicePairingStateFromSFPairState:](DMTSharingDevice, "devicePairingStateFromSFPairState:", objc_msgSend(v5, "systemPairState"));
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)DMTSharingDevice;
  v13 = -[CATSharingDevice initWithIdentifier:modelIdentifier:RSSI:paired:pairingState:detectionTime:](&v15, sel_initWithIdentifier_modelIdentifier_RSSI_paired_pairingState_detectionTime_, v6, v7, v9, v10, v11, v12);

  if (v13)
    objc_storeStrong((id *)&v13->_sharingDevice, a3);

  return v13;
}

+ (BOOL)deviceIsPairedAccordingToFlags:(unsigned int)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;

  _DMTLogGeneral_7();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.15(a3);

  _DMTLogGeneral_7();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.14();

  _DMTLogGeneral_7();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.13();

  _DMTLogGeneral_7();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.12();

  _DMTLogGeneral_7();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.11();

  _DMTLogGeneral_7();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.10();

  _DMTLogGeneral_7();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.9();

  _DMTLogGeneral_7();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.8();

  _DMTLogGeneral_7();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.7();

  _DMTLogGeneral_7();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.6();

  _DMTLogGeneral_7();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.5();

  _DMTLogGeneral_7();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.4();

  _DMTLogGeneral_7();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.3();

  _DMTLogGeneral_7();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.2();

  _DMTLogGeneral_7();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[DMTSharingDevice deviceIsPairedAccordingToFlags:].cold.1();

  return (a3 >> 10) & 1;
}

+ (unint64_t)devicePairingStateFromSFPairState:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;

  v3 = *(_QWORD *)&a3;
  if ((int)a3 <= 19)
  {
    if (!a3)
    {
      _DMTLogGeneral_7();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.2();
      goto LABEL_18;
    }
    if (a3 == 10)
    {
      _DMTLogGeneral_7();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.3();
      v5 = 1;
      goto LABEL_19;
    }
LABEL_16:
    _DMTLogGeneral_7();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.1(v3);
LABEL_18:
    v5 = 0;
    goto LABEL_19;
  }
  if (a3 == 20)
  {
    _DMTLogGeneral_7();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = 2;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.4();
      v5 = 2;
    }
  }
  else
  {
    if (a3 != 30)
      goto LABEL_16;
    _DMTLogGeneral_7();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[DMTSharingDevice devicePairingStateFromSFPairState:].cold.5();
    v5 = 3;
  }
LABEL_19:

  return v5;
}

- (SFDevice)sharingDevice
{
  return self->_sharingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingDevice, 0);
}

+ (void)deviceIsPairedAccordingToFlags:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsEveryoneMode: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsTempPaired: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsShareAudio: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsPaired: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsDeviceClose: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsResume: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsAirDropUsable: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsSharedHome: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.9()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsRangingCapable: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsPeerMe: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.11()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsMyiCloud: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.12()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsFriend: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.13()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsFamily: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:.cold.14()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_1(MEMORY[0x24BDD16E0]), "numberWithBool:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v1, v2, "SFDeviceFlagsMyMe: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)deviceIsPairedAccordingToFlags:(int)a1 .cold.15(int a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 == 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v2, v3, "SFDeviceFlagsNone: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

+ (void)devicePairingStateFromSFPairState:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v2, v3, "Unknown pair state: %{public}@, Sharing has either violated their API contract or added new states.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

+ (void)devicePairingStateFromSFPairState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, v0, v1, "SFPairStateUnknown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)devicePairingStateFromSFPairState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, v0, v1, "SFPairStateNotPaired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)devicePairingStateFromSFPairState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, v0, v1, "SFPairStateConjectured", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)devicePairingStateFromSFPairState:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, v0, v1, "SFPairStateVerified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
