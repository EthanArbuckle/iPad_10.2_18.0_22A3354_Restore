@implementation VCControlChannelMultiWay(Encryption)

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not update encryption cryptors for messaging, result:%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not update encryption cryptors for messaging, result:%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not set currentSendMKI '%@': can not find corresponding cryptor for key");
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not set currentSendMKI '%@': can not find corresponding cryptor for key");
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryptionWithKeyMaterial:()Encryption .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create crypto set for messaging, result:%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryptionWithKeyMaterial:()Encryption .cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not update encryption cryptors for messaging, result:%X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setCurrentSendMKIWithKeyMaterial:()Encryption .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not set currentSendMKI with keyMaterial '%@': absent MKI");
  OUTLINED_FUNCTION_3();
}

- (void)setCurrentSendMKIWithKeyMaterial:()Encryption .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can not set currentSendMKI with keyMaterial '%@': can not find corresponding cryptor");
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryption:()Encryption derivedSSRC:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create cryptoInfo with keyIndex:%@");
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryption:()Encryption derivedSSRC:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d SRTPUpdateEncryptionInfo: failed to update encryption info", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)updateEncryption:()Encryption derivedSSRC:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d updateEncryption: media key/salt derivation failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)encryptData:()Encryption size:sequenceNumber:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d encryptData: _currentSendMKI (%@) failed to match any cryptors");
  OUTLINED_FUNCTION_3();
}

- (void)decryptWithMKI:()Encryption data:size:sequenceNumber:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d decryptWithMKI: MKI (%@) failed to match any cryptors");
  OUTLINED_FUNCTION_3();
}

@end
