@implementation CNEncryptionHelper

+ (id)os_log
{
  if (os_log_cn_once_token_1_9 != -1)
    dispatch_once(&os_log_cn_once_token_1_9, &__block_literal_global_50);
  return (id)os_log_cn_once_object_1_9;
}

void __28__CNEncryptionHelper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "encryption");
  v1 = (void *)os_log_cn_once_object_1_9;
  os_log_cn_once_object_1_9 = (uint64_t)v0;

}

+ (id)encryptAddressingGrammarAsString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "encryptAddressingGrammar:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)decryptAddressingGrammarString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CNEncryptionHelper decryptAddressingGrammarString:].cold.1();
    goto LABEL_9;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CNEncryptionHelper decryptAddressingGrammarString:].cold.2();

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "decryptAddressingGrammarData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v6;
}

+ (id)encryptAddressingGrammar:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;

  if (a3)
  {
    objc_msgSend(a3, "dataRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNDataEncryptor encryptData:keyLabel:](_TtC18ContactsFoundation15CNDataEncryptor, "encryptData:keyLabel:", v3, CFSTR("com.apple.contacts.keys.pronouns"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[CNEncryptionHelper encryptAddressingGrammar:].cold.1();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)decryptAddressingGrammarData:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (a3)
  {
    +[CNDataEncryptor decryptData:keyLabel:](_TtC18ContactsFoundation15CNDataEncryptor, "decryptData:keyLabel:", a3, CFSTR("com.apple.contacts.keys.pronouns"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3960], "termOfAddressFromDataRepresentation:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[CNEncryptionHelper decryptAddressingGrammarData:].cold.1();

      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)decryptAddressingGrammarString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Failed to decrypt pronoun, empty string supplied", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)decryptAddressingGrammarString:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Failed to decrypt pronoun, invalid base64 string supplied", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)encryptAddressingGrammar:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Failed to encrypt pronoun", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)decryptAddressingGrammarData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_18F80C000, v0, v1, "Failed to decrypt data for pronoun", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
