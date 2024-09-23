@implementation _DPToolArguments

- (_DPToolArguments)init
{
  void *v3;
  _DPToolArguments *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v3, "dp_addStringForKey:", kDPTCommandKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTArgumentsCSVKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTMetadataKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTRecordKey);
  objc_msgSend(v3, "dp_addBoolForKey:", kDPTVerboseKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTDataBaseDirectoryPath);
  objc_msgSend(v3, "dp_addBoolForKey:", kDPTWriteOKKey);
  objc_msgSend(v3, "dp_addBoolForKey:", kDPTEnforceMetadataKey);
  v4 = -[_DPToolArguments initWithDictionary:](self, "initWithDictionary:", v3);

  return v4;
}

- (_DPToolArguments)initWithDictionary:(id)a3
{
  id v4;
  _DPToolArguments *v5;
  uint64_t v6;
  NSString *command;
  uint64_t v8;
  NSString *metadata;
  void *v10;
  uint64_t v11;
  NSString *recordKey;
  uint64_t v13;
  NSString *arguments;
  void *v15;
  uint64_t v16;
  NSString *databasePath;
  void *v18;
  void *v19;
  _DPToolArguments *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_DPToolArguments;
  v5 = -[_DPToolArguments init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kDPTCommandKey);
    v6 = objc_claimAutoreleasedReturnValue();
    command = v5->_command;
    v5->_command = (NSString *)v6;

    if (v5->_command)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", kDPTMetadataKey);
      v8 = objc_claimAutoreleasedReturnValue();
      metadata = v5->_metadata;
      v5->_metadata = (NSString *)v8;

      objc_msgSend(v4, "objectForKeyedSubscript:", kDPTEnforceMetadataKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enforceMetadata = objc_msgSend(v10, "BOOLValue");

      if (!v5->_enforceMetadata || v5->_metadata)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", kDPTRecordKey);
        v11 = objc_claimAutoreleasedReturnValue();
        recordKey = v5->_recordKey;
        v5->_recordKey = (NSString *)v11;

        if (!v5->_recordKey)
        {
          v5->_recordKey = (NSString *)CFSTR("com.apple.dprivacytool.TestKey");

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", kDPTArgumentsCSVKey);
        v13 = objc_claimAutoreleasedReturnValue();
        arguments = v5->_arguments;
        v5->_arguments = (NSString *)v13;

        objc_msgSend(v4, "objectForKeyedSubscript:", kDPTVerboseKey);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_verbose = v15 != 0;

        objc_msgSend(v4, "objectForKeyedSubscript:", kDPTDataBaseDirectoryPath);
        v16 = objc_claimAutoreleasedReturnValue();
        databasePath = v5->_databasePath;
        v5->_databasePath = (NSString *)v16;

        objc_msgSend(v4, "objectForKeyedSubscript:", kDPTWriteOKKey);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", kDPTWriteOKKey);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_writeOK = objc_msgSend(v19, "BOOLValue");

        }
        else
        {
          v5->_writeOK = 0;
        }
        goto LABEL_10;
      }
      NSLog(CFSTR("'%@' is set to YES but '%@' is malformed. If you have provided '%@', make sure curly braces are escaped with '\\'."), kDPTEnforceMetadataKey, kDPTMetadataKey, kDPTMetadataKey);
    }
    v20 = 0;
    goto LABEL_13;
  }
LABEL_10:
  v20 = v5;
LABEL_13:

  return v20;
}

- (id)job
{
  return +[_DPToolCommand command:arguments:metadata:recordKey:databasePath:writeOK:](_DPToolCommand, "command:arguments:metadata:recordKey:databasePath:writeOK:", self->_command, self->_arguments, self->_metadata, self->_recordKey, self->_databasePath, self->_writeOK);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *recordKey;
  void *v7;
  void *v8;
  __int128 v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&self->_command;
  recordKey = self->_recordKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_verbose);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { command=%@ ; arguments=%@ ; recordKey=%@ ; verbose=%@ }"),
    v5,
    v10,
    recordKey,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)usage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Usage:\ndprivacytool -%@ <command> -%@ \"arguments to command\" [-%@ '\\{\"key1\":value,\"key2\":value \\}'] [-%@ \"keyName\"] [-%@ YES/NO] [[-%@ \"databasePathname\"] [-%@ YES/NO]], [-%@ YES/NO]\n"), kDPTCommandKey, kDPTArgumentsCSVKey, kDPTMetadataKey, kDPTRecordKey, kDPTVerboseKey, kDPTDataBaseDirectoryPath, kDPTWriteOKKey, kDPTEnforceMetadataKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  +[_DPToolCommand supportedCommands](_DPToolCommand, "supportedCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Supported commands:\n%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  +[_DPToolCommand supportedMetadataKeys](_DPToolCommand, "supportedMetadataKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Supported metadata keys:\n%@\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notes:\n[-%@ YES] is only applicable with [-%@ \"databasePathname\"]\n[-%@ YES] is only applicable for record commands\n"), kDPTWriteOKKey, kDPTDataBaseDirectoryPath, kDPTEnforceMetadataKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), v2, v5, v8, CFSTR("Example of arguments\n\trecordnumbers - \"1,2,3,4\"\n\trecordnumbersvectors - \"1,2,5;9,2\"\n\trecordbitvalues - \"12,21,37\"\n\trecordbitvectors - \"1101110001010101,1111100001101010001\"\n\trecordfloatvectors - \"1,2.5,-3.0; 3.14,2.2,5.9; -4.12,2.15,1.99\"\n\trecordstrings - \"string1,string2,string3\"\n\trecordwords - \"2:SecondWord,1:FirstWord,3:ThirdWord\"\n\tlistreports - \"all\" or \"pending\"\nExample of metadata (only JSON dictionary with escaped curly braces is supported)\n\tv1 - '\\{\"VersionHash\":\"v1\"\\}'\n\tv2 - '\\{\"VersionHash\":\"v2\",\n\t\t\"DediscoTaskConfig\":\\{\n\t\t\"Version\":\"0.1.0\",\n\t\t\"DediscoServerConfiguration\":\\{\n\t\t  \"Leader\":\"dap-leader-apple-01\",\n\t\t  \"Helpers\":[\"dap-helper-apple-01\"]\\},\n\t\t\"TaskExpiration\":4822500466,\n\t\t\"MinBatchSize\":2,\n\t\t\"MaxBatchSize\":1000\\}\\}'\n\n"),
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)command
{
  return self->_command;
}

- (NSString)arguments
{
  return self->_arguments;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (BOOL)enforceMetadata
{
  return self->_enforceMetadata;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)writeOK
{
  return self->_writeOK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
