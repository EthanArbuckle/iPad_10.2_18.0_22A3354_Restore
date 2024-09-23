@implementation UARPSuperBinaryMetaDataTable

- (UARPSuperBinaryMetaDataTable)initWithPlist:(id)a3
{
  id v4;
  UARPSuperBinaryMetaDataTable *v5;
  uint64_t v6;
  NSURL *plist;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    plist = v5->_plist;
    v5->_plist = (NSURL *)v6;

  }
  return v5;
}

- (UARPSuperBinaryMetaDataTable)initWithDictionary:(id)a3
{
  id v4;
  UARPSuperBinaryMetaDataTable *v5;
  uint64_t v6;
  NSDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;

  }
  return v5;
}

- (id)initAppleSpecificWithFormatVersion:(id)a3
{
  id v4;
  UARPSuperBinaryMetaDataTable *v5;
  NSMutableArray *v6;
  NSMutableArray *values;
  uint64_t v8;
  NSNumber *formatVersion;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    values = v5->_values;
    v5->_values = v6;

    v8 = objc_msgSend(v4, "copy");
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSNumber *)v8;

    if (-[NSNumber unsignedIntegerValue](v5->_formatVersion, "unsignedIntegerValue") == 1)
    {
      -[UARPSuperBinaryMetaDataTable addAppleSpecificTLVs](v5, "addAppleSpecificTLVs");
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs](v5, "addHostSpecificTLVs");
    }
    else
    {
      -[UARPSuperBinaryMetaDataTable addDeviceSpecificTLVs2](v5, "addDeviceSpecificTLVs2");
      -[UARPSuperBinaryMetaDataTable addHeySiriModelTLVs2](v5, "addHeySiriModelTLVs2");
      -[UARPSuperBinaryMetaDataTable addPersonalizationTLVs2](v5, "addPersonalizationTLVs2");
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs2](v5, "addHostSpecificTLVs2");
      -[UARPSuperBinaryMetaDataTable addVoiceAssistTLVs2](v5, "addVoiceAssistTLVs2");
      -[UARPSuperBinaryMetaDataTable addLogsTLVs2](v5, "addLogsTLVs2");
      -[UARPSuperBinaryMetaDataTable addAnalyticsTLVs2](v5, "addAnalyticsTLVs2");
      -[UARPSuperBinaryMetaDataTable addComposeTLVs2](v5, "addComposeTLVs2");
      -[UARPSuperBinaryMetaDataTable addSysconfigTlvs](v5, "addSysconfigTlvs");
    }
  }

  return v5;
}

- (id)initVendorAgnosticWithFormatVersion:(id)a3
{
  id v4;
  UARPSuperBinaryMetaDataTable *v5;
  NSMutableArray *v6;
  NSMutableArray *values;
  uint64_t v8;
  NSNumber *formatVersion;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    values = v5->_values;
    v5->_values = v6;

    v8 = objc_msgSend(v4, "copy");
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSNumber *)v8;

    if (-[NSNumber unsignedIntegerValue](v5->_formatVersion, "unsignedIntegerValue") == 1)
    {
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs](v5, "addHostSpecificTLVs");
    }
    else
    {
      -[UARPSuperBinaryMetaDataTable addDeviceSpecificTLVs2](v5, "addDeviceSpecificTLVs2");
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs2](v5, "addHostSpecificTLVs2");
    }
  }

  return v5;
}

- (NSArray)values
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_values);
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "setObject:forKey:", self->_values, CFSTR("MetaData Values"));
  if (-[NSNumber unsignedIntegerValue](self->_formatVersion, "unsignedIntegerValue") >= 2)
    objc_msgSend(v7, "setObject:forKey:", self->_formatVersion, CFSTR("MetaData Format Version"));
  v8 = objc_msgSend(v7, "writeToURL:error:", v6, a4);

  return v8;
}

- (BOOL)expandPlist:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *values;
  NSNumber *v10;
  NSNumber *formatVersion;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:", self->_plist);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MetaData Values"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    values = self->_values;
    self->_values = v8;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MetaData Format Version"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    formatVersion = self->_formatVersion;
    self->_formatVersion = v10;

    if (!self->_formatVersion)
    {
      self->_formatVersion = (NSNumber *)&unk_24CEC03F8;

    }
  }

  return v5 != 0;
}

- (id)tlvWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6
{
  void *v6;
  void *v7;

  -[UARPSuperBinaryMetaDataTable tlvArrayWithKey:keyValue:payloadsURL:error:](self, "tlvArrayWithKey:keyValue:payloadsURL:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tlvArrayWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  UARPSuperBinaryMetaDataTable *v20;
  unint64_t v21;
  id v22;
  void *v23;
  UARPSuperBinaryMetaDataTable *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  UARPSuperBinaryMetaDataTable *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;

  v41 = a3;
  v39 = a4;
  v36 = a5;
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[NSMutableArray count](self->_values, "count");
  if (!v9)
    goto LABEL_57;
  v10 = v9;
  v11 = 0;
  v40 = v9;
  v12 = 0x24BDD1000uLL;
  v13 = 0x24BDBC000uLL;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", v11, v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
      v16 = 0;
      v17 = 0;
      v18 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = 0;
        v16 = 0;
        goto LABEL_12;
      }
      v19 = v12;
      v20 = self;
      v21 = v13;
      v22 = v14;
      objc_msgSend(v22, "objectForKey:", CFSTR("Filepath"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v23, "BOOLValue");
      objc_msgSend(v22, "objectForKey:", CFSTR("Name"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("Value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v11;
      if (v16)
        v18 = objc_msgSend(v16, "unsignedIntegerValue");

      v13 = v21;
      self = v20;
      v12 = v19;
      v10 = v40;
    }
    if (objc_msgSend(v15, "isEqualToString:", v41))
      break;
LABEL_12:

    if (v10 == ++v11)
      goto LABEL_57;
  }
  if (v18 > 3291140095)
  {
    if (v18 <= 3436347647)
    {
      if (v18 == 3291140096 || v18 == 3291140105)
      {
LABEL_42:
        -[UARPSuperBinaryMetaDataTable addTLV:keyValue32:tlvArray:](self, "addTLV:keyValue32:tlvArray:", v18, v39, v38);
        goto LABEL_56;
      }
      if (v18 == 3291140106)
      {
        -[UARPSuperBinaryMetaDataTable addTLVs:excludedHwRevisions:tlvArray:](self, "addTLVs:excludedHwRevisions:tlvArray:", 3291140106, v39, v38);
        goto LABEL_56;
      }
    }
    else
    {
      switch(v18)
      {
        case 3436347648:
          v24 = self;
          v25 = 3436347648;
          v26 = 0;
          goto LABEL_55;
        case 3436347649:
          v25 = 3436347649;
          v24 = self;
          v26 = 1;
          goto LABEL_55;
        case 3436347650:
          v25 = 3436347650;
          v24 = self;
          v26 = 2;
          goto LABEL_55;
        case 3436347651:
          v25 = 3436347651;
          v24 = self;
          v26 = 3;
          goto LABEL_55;
        case 3436347652:
          v25 = 3436347652;
          v24 = self;
          v26 = 4;
          goto LABEL_55;
        case 3436347653:
          v25 = 3436347653;
          v24 = self;
          v26 = 5;
          goto LABEL_55;
        case 3436347654:
          v25 = 3436347654;
          v24 = self;
          v26 = 6;
          goto LABEL_55;
        case 3436347655:
          v25 = 3436347655;
          v24 = self;
          v26 = 7;
LABEL_55:
          -[UARPSuperBinaryMetaDataTable addTLV:legacyTLV:keyValue:tlvArray:payloadsURL:isFilepath:](v24, "addTLV:legacyTLV:keyValue:tlvArray:payloadsURL:isFilepath:", v25, v26, v39, v38, v36, v17);
          goto LABEL_56;
        case 3436347656:
        case 3436347657:
        case 3436347658:
        case 3436347665:
        case 3436347667:
        case 3436347668:
        case 3436347669:
        case 3436347672:
          break;
        case 3436347659:
        case 3436347661:
        case 3436347662:
        case 3436347664:
        case 3436347666:
        case 3436347671:
          goto LABEL_29;
        case 3436347660:
          -[UARPSuperBinaryMetaDataTable addTLVCompressPayloadAlgorithm:tlvArray:](self, "addTLVCompressPayloadAlgorithm:tlvArray:", v39, v38);
          goto LABEL_56;
        case 3436347663:
        case 3436347673:
          goto LABEL_42;
        case 3436347670:
          goto LABEL_56;
        case 3436347674:
          goto LABEL_17;
        default:
          if (v18 == 4042160641)
          {
LABEL_43:
            v28 = self;
            v29 = v18;
            v31 = v38;
            v30 = v39;
            v32 = v36;
            v33 = 0;
            goto LABEL_45;
          }
          if (v18 == 4042160643)
          {
LABEL_17:
            -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:](self, "addTLV:keyValue8:tlvArray:", v18, v39, v38);
            goto LABEL_56;
          }
          break;
      }
    }
  }
  else
  {
    if (v18 > 2293403930)
    {
      switch(v18)
      {
        case 2293403931:
          -[UARPSuperBinaryMetaDataTable addTLV:keyValue64:tlvArray:](self, "addTLV:keyValue64:tlvArray:", 2293403931, v39, v38);
          break;
        case 2293403932:
          -[UARPSuperBinaryMetaDataTable composeMatchingPayloads:tlvArray:](self, "composeMatchingPayloads:tlvArray:", v39, v38);
          break;
        case 2293403933:
        case 2293403934:
        case 2293403935:
        case 2293403936:
        case 2293403939:
        case 2293403940:
        case 2293403943:
        case 2293403945:
        case 2293403946:
        case 2293403947:
        case 2293403948:
        case 2293403949:
        case 2293403950:
        case 2293403951:
        case 2293403952:
          goto LABEL_44;
        case 2293403937:
        case 2293403938:
        case 2293403942:
        case 2293403944:
        case 2293403953:
        case 2293403954:
        case 2293403955:
          goto LABEL_17;
        case 2293403941:
          goto LABEL_42;
        default:
          switch(v18)
          {
            case 3166200576:
            case 3166200579:
              UARPPayloadHashAlgorithmStringToValue(v39);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[UARPSuperBinaryMetaDataTable addTLV:keyValue16:tlvArray:](self, "addTLV:keyValue16:tlvArray:", v18, v27, v38);

              break;
            case 3166200577:
            case 3166200578:
              -[UARPSuperBinaryMetaDataTable composeMeasuredPayloads:tlvType:tlvArray:payloadsURL:](self, "composeMeasuredPayloads:tlvType:tlvArray:payloadsURL:", v39, v18, v38, v36);
              break;
            case 3166200580:
              -[UARPSuperBinaryMetaDataTable composeRequiredPersonalizationOptions:tlvArray:](self, "composeRequiredPersonalizationOptions:tlvArray:", v39, v38);
              break;
            case 3166200581:
            case 3166200582:
              v28 = self;
              v29 = v18;
              v31 = v38;
              v30 = v39;
              v32 = v36;
              v33 = 1;
              goto LABEL_45;
            case 3166200583:
              goto LABEL_17;
            default:
              goto LABEL_44;
          }
          break;
      }
      goto LABEL_56;
    }
    if (v18 > 538280447)
    {
      switch(v18)
      {
        case 1619725824:
        case 1619725827:
        case 1619725832:
          goto LABEL_29;
        case 1619725825:
        case 1619725826:
        case 1619725828:
        case 1619725829:
        case 1619725830:
          goto LABEL_44;
        case 1619725831:
          goto LABEL_34;
        default:
          if (v18 == 538280448)
            goto LABEL_43;
          if (v18 == 538280449)
            goto LABEL_42;
          goto LABEL_44;
      }
    }
    if (v18 == 76079616 || v18 == 76079619)
    {
LABEL_29:
      -[UARPSuperBinaryMetaDataTable addTLV:keyValue16:tlvArray:](self, "addTLV:keyValue16:tlvArray:", v18, v39, v38);
      goto LABEL_56;
    }
    if (v18 == 76079623)
    {
LABEL_34:
      -[UARPSuperBinaryMetaDataTable addTLV:versionString:tlvArray:](self, "addTLV:versionString:tlvArray:", v18, v39, v38);
      goto LABEL_56;
    }
  }
LABEL_44:
  v28 = self;
  v29 = v18;
  v31 = v38;
  v30 = v39;
  v32 = v36;
  v33 = v17;
LABEL_45:
  -[UARPSuperBinaryMetaDataTable addTLV:keyValue:tlvArray:payloadsURL:isFilepath:](v28, "addTLV:keyValue:tlvArray:payloadsURL:isFilepath:", v29, v30, v31, v32, v33);
LABEL_56:

LABEL_57:
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v38, v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (void)addAppleSpecificTLVs
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Payload Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Payload Long Name"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Minimum Required Version"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Ignore Version"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Urgent Update"));
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Payload Certificate"), CFSTR("Name"));
  v4 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Payload Signature"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Payload Hash"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Personalization Required"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Personalization Payload Tag"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Personalization SuperBinary AssetID"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Personalization Manifest Prefix"));

}

- (void)addDeviceSpecificTLVs2
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Payload Filepath"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0410, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Payload Long Name"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0428, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Minimum Required Version"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC0440, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Ignore Version"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CEC0458, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Urgent Update"), CFSTR("Name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CEC0470, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Payload Certificate"), CFSTR("Name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CEC0488, CFSTR("Value"));
  v9 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Payload Signature"), CFSTR("Name"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CEC04A0, CFSTR("Value"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Payload Hash"), CFSTR("Name"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24CEC04B8, CFSTR("Value"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Payload Digest"), CFSTR("Name"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24CEC04D0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v12);
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Minimum Battery Level"), CFSTR("Name"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24CEC04E8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v13);
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Trigger Battery Level"), CFSTR("Name"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24CEC0500, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v14);
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Payload Compression ChunkSize"), CFSTR("Name"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24CEC0518, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v15);
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Payload Compression Algorithm"), CFSTR("Name"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_24CEC0530, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v16);
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("Flash Partition Bitmap"), CFSTR("Name"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24CEC0548, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v17);
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("Flash Partition Boot"), CFSTR("Name"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24CEC0560, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v18);
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("Compressed Headers Payload Index"), CFSTR("Name"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24CEC0578, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v19);
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("Erase Option"), CFSTR("Name"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24CEC0590, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v20);
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("Payload Expand Filename"), CFSTR("Name"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_24CEC05A8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v21);
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("Payload Hash Algorithm"), CFSTR("Name"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_24CEC05C0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v22);
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("Compressed Headers"), CFSTR("Name"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_24CEC05D8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v23);
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("Payload Description"), CFSTR("Name"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_24CEC05F0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v24);
  v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("Payload Signature (Development)"), CFSTR("Name"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_24CEC0608, CFSTR("Value"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v9, CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v25);
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("Device Specific Data"), CFSTR("Name"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24CEC0620, CFSTR("Value"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v9, CFSTR("Filepath"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v26);
  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("MetaData Hash Algorithm"), CFSTR("Name"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_24CEC0638, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v27);
  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("MetaData Hash"), CFSTR("Name"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_24CEC0650, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v28);
  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("Uncompressed Payload Length"), CFSTR("Name"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_24CEC0668, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v29);
  v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("No Compressed Headers"), CFSTR("Name"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_24CEC0680, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v30);

}

- (void)addHostSpecificTLVs
{
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Host Minimum Battery Level"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Host Inactive To Stage Asset"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Host Inactive To Apply Asset"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Host Network Delay"));
  -[NSMutableArray addObject:](self->_values, "addObject:", CFSTR("Host Reconnect After Apply"));
}

- (void)addHeySiriModelTLVs2
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Type"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0698, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Locale"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC06B0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Hash"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC06C8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Role"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CEC06E0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Digest"), CFSTR("Name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CEC06F8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Signature"), CFSTR("Name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CEC0710, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Certificate"), CFSTR("Name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24CEC0728, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Engine Version"), CFSTR("Name"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CEC0740, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("HeySiri Model Engine Type"), CFSTR("Name"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24CEC0758, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);

}

- (void)addVoiceAssistTLVs2
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Type"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0770, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Locale"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0788, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Hash"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC07A0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Role"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CEC07B8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Digest"), CFSTR("Name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CEC07D0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Signature"), CFSTR("Name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CEC07E8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Certificate"), CFSTR("Name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24CEC0800, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Voice Assist Engine Version"), CFSTR("Name"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CEC0818, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);

}

- (void)addPersonalizationTLVs2
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Personalization Required"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0830, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Tag"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0848, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Personalization SuperBinary AssetID"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC0860, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Personalization Manifest Prefix"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CEC0878, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Personalization Board ID"), CFSTR("Name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CEC0890, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Personalization Chip ID"), CFSTR("Name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CEC08A8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Personalization ECID"), CFSTR("Name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24CEC08C0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Personalization ECID Data"), CFSTR("Name"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CEC08D8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Personalization Nonce"), CFSTR("Name"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24CEC08F0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Personalization Nonce Hash"), CFSTR("Name"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24CEC0908, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v12);
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Personalization Security Domain"), CFSTR("Name"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24CEC0920, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v13);
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Personalization Security Mode"), CFSTR("Name"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24CEC0938, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v14);
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalization Production Mode"), CFSTR("Name"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_24CEC0950, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v15);
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalization Chip Epoch"), CFSTR("Name"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_24CEC0968, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v16);
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("Personalization Enable Mix Match"), CFSTR("Name"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24CEC0980, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v17);
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("Personalization SuperBinary Payload Index"), CFSTR("Name"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24CEC0998, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v18);
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("Personalization Chip Revision"), CFSTR("Name"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24CEC09B0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v19);
  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload"), CFSTR("Name"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_24CEC09C8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v20);
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Tag"), CFSTR("Name"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_24CEC09E0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v21);
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Longname"), CFSTR("Name"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_24CEC09F8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v22);
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Digest"), CFSTR("Name"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_24CEC0A10, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v23);
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Hash Algorithm"), CFSTR("Name"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_24CEC0A28, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v24);
  v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Security Mode"), CFSTR("Name"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_24CEC0A40, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v25);
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Production Mode"), CFSTR("Name"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24CEC0A58, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v26);
  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Trusted"), CFSTR("Name"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_24CEC0A70, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v27);
  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("Personalization SoC Live Nonce"), CFSTR("Name"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_24CEC0A88, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v28);
  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Security Mode Host Override"), CFSTR("Name"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_24CEC0AA0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v29);
  v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Production Mode Host Override"), CFSTR("Name"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_24CEC0AB8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v30);
  v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Hash Algorithm"), CFSTR("Name"));
  objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_24CEC0A28, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v31);
  v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Longname"), CFSTR("Name"));
  objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_24CEC09F8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v32);
  v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v33, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Effective Security Mode"), CFSTR("Name"));
  objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_24CEC0A40, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v33);
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v34, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Effective Production Mode"), CFSTR("Name"));
  objc_msgSend(v34, "setObject:forKeyedSubscript:", &unk_24CEC0A58, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v34);
  v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v35, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Trusted"), CFSTR("Name"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_24CEC0A70, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v35);
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v36, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Digest"), CFSTR("Name"));
  objc_msgSend(v36, "setObject:forKeyedSubscript:", &unk_24CEC0A10, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v36);
  v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v37, "setObject:forKeyedSubscript:", CFSTR("Personalization Board ID (64 bits)"), CFSTR("Name"));
  objc_msgSend(v37, "setObject:forKeyedSubscript:", &unk_24CEC0AD0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v37);
  v38 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v38, "setObject:forKeyedSubscript:", CFSTR("Personalization Matching Data"), CFSTR("Name"));
  objc_msgSend(v38, "setObject:forKeyedSubscript:", &unk_24CEC0AE8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v38);
  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v39, "setObject:forKeyedSubscript:", CFSTR("Personalization Matching Data Product Revision Minimum"), CFSTR("Name"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", &unk_24CEC0B00, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v39);
  v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("Personalization Matching Data Product Revision Maximum"), CFSTR("Name"));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", &unk_24CEC0B18, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v40);
  v41 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v41, "setObject:forKeyedSubscript:", CFSTR("Personalization Matching Data Payload Tags"), CFSTR("Name"));
  objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_24CEC0B30, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v41);
  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v42, "setObject:forKeyedSubscript:", CFSTR("Personalization Digest List Size"), CFSTR("Name"));
  objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_24CEC0B48, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v42);
  v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("Personalization Prefix Needs Logical Unit Number"), CFSTR("Name"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", &unk_24CEC0B60, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v43);
  v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v44, "setObject:forKeyedSubscript:", CFSTR("Personalization Suffix Needs Logical Unit Number"), CFSTR("Name"));
  objc_msgSend(v44, "setObject:forKeyedSubscript:", &unk_24CEC0B78, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v44);
  v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v45, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Demotion Security Mode"), CFSTR("Name"));
  objc_msgSend(v45, "setObject:forKeyedSubscript:", &unk_24CEC0B90, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v45);
  v46 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v46, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Demotion Production Mode"), CFSTR("Name"));
  objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_24CEC0BA8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v46);
  v47 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v47, "setObject:forKeyedSubscript:", CFSTR("Personalization Logical Unit Number"), CFSTR("Name"));
  objc_msgSend(v47, "setObject:forKeyedSubscript:", &unk_24CEC0BC0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v47);
  v48 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v48, "setObject:forKeyedSubscript:", CFSTR("Personalization Ticket Needs Logical Unit Number"), CFSTR("Name"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", &unk_24CEC0BD8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v48);
  v49 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v49, "setObject:forKeyedSubscript:", CFSTR("Personalization More Requests to Follow"), CFSTR("Name"));
  objc_msgSend(v49, "setObject:forKeyedSubscript:", &unk_24CEC0BF0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v49);
  v50 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v50, "setObject:forKeyedSubscript:", CFSTR("Host Personalization Required"), CFSTR("Name"));
  objc_msgSend(v50, "setObject:forKeyedSubscript:", &unk_24CEC0C08, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v50);
  v51 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v51, "setObject:forKeyedSubscript:", CFSTR("Required Personalization Option"), CFSTR("Name"));
  objc_msgSend(v51, "setObject:forKeyedSubscript:", &unk_24CEC0C20, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v51);
  v52 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v52, "setObject:forKeyedSubscript:", CFSTR("Personalized Manifest"), CFSTR("Name"));
  objc_msgSend(v52, "setObject:forKeyedSubscript:", &unk_24CEC0C38, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v52);
  v53 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v53, "setObject:forKeyedSubscript:", CFSTR("Personalization Life"), CFSTR("Name"));
  objc_msgSend(v53, "setObject:forKeyedSubscript:", &unk_24CEC0C50, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v53);
  v54 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v54, "setObject:forKeyedSubscript:", CFSTR("Personalization Provisioning"), CFSTR("Name"));
  objc_msgSend(v54, "setObject:forKeyedSubscript:", &unk_24CEC0C68, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v54);
  v55 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v55, "setObject:forKeyedSubscript:", CFSTR("Personalization Manifest Epoch"), CFSTR("Name"));
  objc_msgSend(v55, "setObject:forKeyedSubscript:", &unk_24CEC0C80, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v55);
  v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v56, "setObject:forKeyedSubscript:", CFSTR("Personalization Manifest Suffix"), CFSTR("Name"));
  objc_msgSend(v56, "setObject:forKeyedSubscript:", &unk_24CEC0C98, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v56);
  v57 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v57, "setObject:forKeyedSubscript:", CFSTR("Personalization FTAB Payload Digest Filename"), CFSTR("Name"));
  objc_msgSend(v57, "setObject:forKeyedSubscript:", &unk_24CEC0CB0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v57);
  v58 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v58, "setObject:forKeyedSubscript:", CFSTR("Personalization Payload Digest Filename"), CFSTR("Name"));
  objc_msgSend(v58, "setObject:forKeyedSubscript:", &unk_24CEC0CB0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v58);

}

- (void)addHostSpecificTLVs2
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Host Minimum Battery Level"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0CC8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Host Inactive To Stage Asset"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0CE0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Host Inactive To Apply Asset"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC0CF8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Host Network Delay"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CEC0D10, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Host Reconnect After Apply"), CFSTR("Name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CEC0D28, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Minimum iOS Version"), CFSTR("Name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CEC0D40, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Minimum macOS Version"), CFSTR("Name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24CEC0D58, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Minimum tvOS Version"), CFSTR("Name"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CEC0D70, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Minimum watchOS Version"), CFSTR("Name"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24CEC0D88, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Host Trigger Battery Level"), CFSTR("Name"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24CEC0DA0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v12);
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Excluded Hardware Version"), CFSTR("Name"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24CEC0DB8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v13);

}

- (void)addLogsTLVs2
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Log Friendly Name"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0DD0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Log Apple Model Number"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0DE8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Log Serial Number"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC0E00, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);

}

- (void)addAnalyticsTLVs2
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Analytics Event Name"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0E18, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Analytics Payload Type"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0E30, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);

}

- (void)addComposeTLVs2
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Compose Payload Hash Algorithm"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0E48, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Compose Measured Payloads"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0E60, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Compose Measured Payloads (Non-FTAB)"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC0E78, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Compose MetaData Hash Algorithm"), CFSTR("Name"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24CEC0E90, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Personalization Options Required"), CFSTR("Name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CEC0EA8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Version File"), CFSTR("Name"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CEC0EC0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Version BVER File"), CFSTR("Name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24CEC0ED8, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Property List Payload"), CFSTR("Name"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24CEC0EF0, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);

}

- (void)addMappedAnalyticsTlvs
{
  id v3;
  id v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Log Apple Model Number"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0F08, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Mapped Analytics Event ID"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0F20, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);

}

- (void)addSysconfigTlvs
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Sysconfig Region Code"), CFSTR("Name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CEC0F38, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Sysconfig Manufacturing Part Number"), CFSTR("Name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24CEC0F50, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Sysconfig Regulatory Model Number"), CFSTR("Name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24CEC0F68, CFSTR("Value"));
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);

}

- (id)createTLVWithType:(unint64_t)a3 keyValue:(id)a4 payloadsURL:(id)a5 isFilepath:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  UARPSuperBinaryAssetTLV *v12;
  UARPSuperBinaryAssetTLV *v13;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:relativeToURL:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UARPSuperBinaryAssetTLV initWithType:urlValue:]([UARPSuperBinaryAssetTLV alloc], "initWithType:urlValue:", a3, v11);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:]([UARPSuperBinaryAssetTLV alloc], "initWithType:stringValue:", a3, v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", a3, objc_msgSend(v9, "unsignedLongValue"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = 0;
          goto LABEL_11;
        }
        v13 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:]([UARPSuperBinaryAssetTLV alloc], "initWithType:dataValue:", a3, v9);
      }
    }
    v12 = v13;
  }
LABEL_11:

  return v12;
}

+ (unsigned)compressionAlgorithmFromString:(id)a3
{
  return 0;
}

- (void)addTLV:(unint64_t)a3 keyValue:(id)a4 tlvArray:(id)a5 payloadsURL:(id)a6 isFilepath:(BOOL)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;

  v7 = a7;
  v13 = a5;
  -[UARPSuperBinaryMetaDataTable createTLVWithType:keyValue:payloadsURL:isFilepath:](self, "createTLVWithType:keyValue:payloadsURL:isFilepath:", a3, a4, a6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v13, "addObject:", v12);

}

- (void)addTLV:(unint64_t)a3 legacyTLV:(unint64_t)a4 keyValue:(id)a5 tlvArray:(id)a6 payloadsURL:(id)a7 isFilepath:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;

  v8 = a8;
  v16 = a5;
  v14 = a6;
  v15 = a7;
  -[UARPSuperBinaryMetaDataTable addTLV:keyValue:tlvArray:payloadsURL:isFilepath:](self, "addTLV:keyValue:tlvArray:payloadsURL:isFilepath:", a3, v16, v14, v15, v8);
  if (-[NSNumber unsignedIntegerValue](self->_formatVersion, "unsignedIntegerValue") <= 2)
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue:tlvArray:payloadsURL:isFilepath:](self, "addTLV:keyValue:tlvArray:payloadsURL:isFilepath:", a4, v16, v14, v15, v8);

}

- (void)addTLV:(unint64_t)a3 keyValue8:(id)a4 tlvArray:(id)a5
{
  id v7;
  id v8;
  UARPSuperBinaryAssetTLV *v9;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt8:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt8:", a3, objc_msgSend(v7, "unsignedCharValue"));
    objc_msgSend(v8, "addObject:", v9);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }

}

- (void)addTLV:(unint64_t)a3 keyValue16:(id)a4 tlvArray:(id)a5
{
  id v7;
  id v8;
  UARPSuperBinaryAssetTLV *v9;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", a3, objc_msgSend(v7, "unsignedShortValue"));
    objc_msgSend(v8, "addObject:", v9);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }

}

- (void)addTLV:(unint64_t)a3 keyValue32:(id)a4 tlvArray:(id)a5
{
  id v7;
  id v8;
  UARPSuperBinaryAssetTLV *v9;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", a3, objc_msgSend(v7, "unsignedLongValue"));
    objc_msgSend(v8, "addObject:", v9);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }

}

- (void)addTLV:(unint64_t)a3 keyValue64:(id)a4 tlvArray:(id)a5
{
  id v7;
  id v8;
  UARPSuperBinaryAssetTLV *v9;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt64:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt64:", a3, objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v8, "addObject:", v9);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }

}

- (void)addTLVCompressPayloadAlgorithm:(id)a3 tlvArray:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = +[UARPSuperBinaryMetaDataTable compressionAlgorithmFromString:](UARPSuperBinaryMetaDataTable, "compressionAlgorithmFromString:", v6);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue32:tlvArray:](self, "addTLV:keyValue32:tlvArray:", 3436347660, v9, v7);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLVCompressPayloadAlgorithm:tlvArray:].cold.1();
  }

}

- (void)addTLV:(unint64_t)a3 versionString:(id)a4 tlvArray:(id)a5
{
  id v7;
  id v8;
  UARPSuperBinaryAssetTLV *v9;
  _QWORD v10[2];

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10[0] = 0;
    v10[1] = 0;
    +[UARPSuperBinaryAsset versionFromString:version:](UARPSuperBinaryAsset, "versionFromString:version:", v7, v10);
    v9 = -[UARPSuperBinaryAssetTLV initWithType:version:]([UARPSuperBinaryAssetTLV alloc], "initWithType:version:", a3, v10);
    objc_msgSend(v8, "addObject:", v9);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:versionString:tlvArray:].cold.1();
  }

}

- (void)addTLVs:(unint64_t)a3 excludedHwRevisions:(id)a4 tlvArray:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UARPSuperBinaryAssetTLV *v15;
  UARPSuperBinaryAssetTLV *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
          v15 = [UARPSuperBinaryAssetTLV alloc];
          v16 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v15, "initWithType:stringValue:", a3, v14, (_QWORD)v17);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLVs:excludedHwRevisions:tlvArray:].cold.1();
  }

}

- (NSNumber)formatVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

- (void)addTLV:keyValue8:tlvArray:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "invalid plist, trying to use non-number for TLV %lx", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)addTLVCompressPayloadAlgorithm:tlvArray:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "invalid plist, trying to use non-string to add compression algorithm", v0, 2u);
}

- (void)addTLV:versionString:tlvArray:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "invalid plist, trying to use non-string for TLV %lx", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)addTLVs:excludedHwRevisions:tlvArray:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "invalid plist, trying to use non-array for TLV %lx", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
