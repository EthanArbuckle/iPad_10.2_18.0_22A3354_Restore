@implementation MIOVersion

+ (id)versionZero
{
  return -[MIOVersion initWithVersionString:error:]([MIOVersion alloc], "initWithVersionString:error:", CFSTR("0.0"), 0);
}

- (MIOVersion)init
{
  void *v3;
  void *v4;
  MIOVersion *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MIOVersion initWithVersionString:error:](self, "initWithVersionString:error:", v4, 0);
  return v5;
}

- (MIOVersion)initWithVersionString:(id)a3 error:(id *)a4
{
  id v6;
  MIOVersion *v7;
  void *v8;
  void *v9;
  MIOVersion *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSString *modifier;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MIOVersion;
  v7 = -[MIOVersion init](&v28, sel_init);
  if (!v7)
    goto LABEL_24;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 2 && (unint64_t)objc_msgSend(v8, "count") < 4)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MIOVersion isAllDigitsInString:](v7, "isAllDigitsInString:", v11);

    if (v12)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_major = objc_msgSend(v13, "intValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MIOVersion isAllDigitsInString:](v7, "isAllDigitsInString:", v14);

      if (v15)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_minor = objc_msgSend(v16, "intValue");

        v7->_bugfix = 0;
        modifier = v7->_modifier;
        v7->_modifier = (NSString *)&stru_24CA45E28;

        if (objc_msgSend(v8, "count") == 3)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[MIOVersion isAllDigitsInString:](v7, "isAllDigitsInString:", v18))
          {
            v7->_bugfix = objc_msgSend(v18, "intValue");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "rangeOfCharacterFromSet:", v19);

            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (a4)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", 0, -1);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_7;
            }
            objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v21);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = v7->_modifier;
            v7->_modifier = (NSString *)v22;

            objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "invertedSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v7->_bugfix = objc_msgSend(v26, "intValue");

          }
        }

LABEL_24:
        v10 = v7;
        goto LABEL_25;
      }
      if (!a4)
        goto LABEL_7;
    }
    else if (!a4)
    {
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", 0, -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "internalWarningWithMessage:code:", 0, -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    *a4 = v9;
  }
LABEL_7:

  v10 = 0;
LABEL_25:

  return v10;
}

- (id)getVersionAsString
{
  unsigned int bugfix;
  NSUInteger v4;
  uint64_t major;
  uint64_t minor;
  uint64_t v7;
  NSString *modifier;
  uint64_t v10;
  uint64_t v11;

  bugfix = self->_bugfix;
  v4 = -[NSString length](self->_modifier, "length");
  major = self->_major;
  minor = self->_minor;
  if (bugfix)
  {
    v7 = self->_bugfix;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d.%d"), major, self->_minor, v7, v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    modifier = self->_modifier;
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d"), self->_major, minor, v10, v11);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    modifier = self->_modifier;
    v7 = self->_bugfix;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d.%d%@"), major, minor, v7, modifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)compareToVersion:(id)a3
{
  id v4;
  unsigned int v5;
  int64_t v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot compare with nil object."), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v5 = -[MIOVersion major](self, "major");
  if (v5 < objc_msgSend(v4, "major"))
    goto LABEL_3;
  v7 = -[MIOVersion major](self, "major");
  if (v7 > objc_msgSend(v4, "major"))
  {
LABEL_5:
    v6 = 1;
    goto LABEL_6;
  }
  v9 = -[MIOVersion minor](self, "minor");
  if (v9 >= objc_msgSend(v4, "minor"))
  {
    v10 = -[MIOVersion minor](self, "minor");
    if (v10 > objc_msgSend(v4, "minor"))
      goto LABEL_5;
    v11 = -[MIOVersion bugfix](self, "bugfix");
    if (v11 >= objc_msgSend(v4, "bugfix"))
    {
      v12 = -[MIOVersion bugfix](self, "bugfix");
      if (v12 <= objc_msgSend(v4, "bugfix"))
      {
        -[MIOVersion modifier](self, "modifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "modifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v13, "compare:", v14);

        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_3:
  v6 = -1;
LABEL_6:

  return v6;
}

- (BOOL)isEqualToVersion:(id)a3
{
  return -[MIOVersion compareToVersion:](self, "compareToVersion:", a3) == 0;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[MIOVersion getVersionAsString](self, "getVersionAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Version: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAllDigitsInString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v3, "length") != 0;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MIOVersion *v4;
  void *v5;
  MIOVersion *v6;
  id v7;
  id v9;
  id v10;

  v4 = +[MIOVersion allocWithZone:](MIOVersion, "allocWithZone:", a3);
  -[MIOVersion getVersionAsString](self, "getVersionAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = -[MIOVersion initWithVersionString:error:](v4, "initWithVersionString:error:", v5, &v10);
  v7 = v10;

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot copy version %@"), v7);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MIOVersion isEqualToVersion:](self, "isEqualToVersion:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MIOVersion getVersionAsString](self, "getVersionAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)pre3_15_0_Mapping
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[15];
  _QWORD v8[16];

  v8[15] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping;
  if (!+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping)
  {
    v8[0] = CFSTR("mdta/com.apple.trackStreamType");
    objc_msgSend(CFSTR("mdta/com.apple.track_kind"), "stringByAppendingFormat:", CFSTR("_%@"), CFSTR("metadata"), CFSTR("mdta/com.apple.track_kind"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = v3;
    v8[1] = CFSTR("mdta/com.apple.metadataTrackType");
    v8[2] = CFSTR("mdta/com.apple.MOVStreamIO.stateMetadataIdentifier");
    v7[2] = CFSTR("mdta/com.apple.framework.state.MOVStreamIO");
    v7[3] = CFSTR("version");
    v8[3] = CFSTR("mdta/com.apple.MOVStreamIO.versionKey");
    v8[4] = CFSTR("mdta/com.apple.MOVStreamIO.defaultOptions");
    v7[4] = CFSTR("default_options");
    v7[5] = CFSTR("mdta/com.apple.stream_sample_format");
    v8[5] = CFSTR("mdta/com.apple.trackStreamPixelFormat");
    v8[6] = CFSTR("mdta/com.apple.trackStreamEncodedPixelFormat");
    v7[6] = CFSTR("mdta/com.apple.stream_encoded_sample_format");
    v7[7] = CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode");
    v8[7] = CFSTR("mdta/com.apple.trackStreamAttachmentsSerializationMode");
    v8[8] = CFSTR("mdta/com.apple.trackTypeInfo");
    v7[8] = CFSTR("mdta/com.apple.stream_type_info");
    v7[9] = CFSTR("mdta/com.apple.stream_related_to_stream");
    v8[9] = CFSTR("mdta/com.apple.trackStreamRelatedToStream");
    v8[10] = CFSTR("mdta/com.apple.trackStreamRelationSpecifier");
    v7[10] = CFSTR("mdta/com.apple.stream_relation_specifier");
    v7[11] = CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row");
    v8[11] = CFSTR("mdta/com.apple.exactBytesPerRow");
    v8[12] = CFSTR("mdta/com.apple.RawBayerRearrangeType");
    v7[12] = CFSTR("mdta/com.apple.stream_raw_bayer_rearrange_type");
    v7[13] = CFSTR("mdta/com.apple.stream_sample_attachments");
    v7[14] = CFSTR("mdta/com.apple.metadata_stream_item");
    v8[13] = CFSTR("mdta/com.apple.rawSampleBufferAttachmentDict");
    v8[14] = CFSTR("mdta/com.apple.metadataDict");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 15);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping;
    +[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping = v4;

    v2 = (void *)+[MIOVersion pre3_15_0_Mapping]::pre3_15_0_Mapping;
  }
  return v2;
}

+ (id)allVersionedKeysForKey:(id)a3 modifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "addObject:", v5);
  if (v6)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("_%@"), v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  +[MIOVersion pre3_15_0_Mapping](MIOVersion, "pre3_15_0_Mapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v7, "addObject:", v10);

  return v7;
}

- (id)versionedKey:(id)a3 modifier:(id)a4
{
  id v6;
  id v7;
  MIOVersion *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (!-[MIOVersion versionedKey:modifier:]::ref3150Version)
  {
    v8 = -[MIOVersion initWithVersionString:error:]([MIOVersion alloc], "initWithVersionString:error:", CFSTR("3.15.0"), 0);
    v9 = (void *)-[MIOVersion versionedKey:modifier:]::ref3150Version;
    -[MIOVersion versionedKey:modifier:]::ref3150Version = (uint64_t)v8;

  }
  if (-[MIOVersion compareToVersion:](self, "compareToVersion:") != -1)
  {
    v10 = 0;
LABEL_5:
    v6 = v6;
    v11 = v6;
    goto LABEL_6;
  }
  +[MIOVersion pre3_15_0_Mapping](MIOVersion, "pre3_15_0_Mapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_5;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("_%@"), v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v13;
  }
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
LABEL_6:

  return v11;
}

- (unsigned)major
{
  return self->_major;
}

- (unsigned)minor
{
  return self->_minor;
}

- (unsigned)bugfix
{
  return self->_bugfix;
}

- (NSString)modifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);
}

@end
