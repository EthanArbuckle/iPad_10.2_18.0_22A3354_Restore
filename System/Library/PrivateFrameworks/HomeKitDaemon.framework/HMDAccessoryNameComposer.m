@implementation HMDAccessoryNameComposer

- (HMDAccessoryNameComposer)initWithRawAccessoryName:(id)a3 rawRoomName:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryNameComposer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  objc_super v42;

  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HMDAccessoryNameComposer;
  v8 = -[HMDAccessoryNameComposer init](&v42, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[HMDAccessoryNameComposer setRawAccessoryName:](v8, "setRawAccessoryName:", v9);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNameComposer setAccessoryName:](v8, "setAccessoryName:", v11);

    v12 = (void *)objc_msgSend(v7, "copy");
    -[HMDAccessoryNameComposer setRawRoomName:](v8, "setRawRoomName:", v12);

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNameComposer setRoomName:](v8, "setRoomName:", v14);

    -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
LABEL_18:

      goto LABEL_19;
    }
    -[HMDAccessoryNameComposer roomName](v8, "roomName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "length"))
    {
LABEL_17:

      goto LABEL_18;
    }
    -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNameComposer roomName](v8, "roomName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNameComposer roomName](v8, "roomName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "rangeOfString:options:", v21, 129);
      v24 = v23;

      if (v24)
      {
        v25 = v22 + v24;
        -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");

        if (!v22)
        {
          -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "substringFromIndex:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v29, "rangeOfCharacterFromSet:options:", v30, 0);

          if (v25 != v27)
          {
            -[HMDAccessoryNameComposer setRoomNameAtEndSeparatedByWhitespace:](v8, "setRoomNameAtEndSeparatedByWhitespace:", 0);
            if (!v40)
            {
LABEL_16:
              -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringByReplacingCharactersInRange:withString:", v22, v24, &stru_24E79DB48);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAccessoryNameComposer setAccessoryName:](v8, "setAccessoryName:", v37);

              -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAccessoryNameComposer setAccessoryName:](v8, "setAccessoryName:", v38);

              goto LABEL_17;
            }
LABEL_15:
            if (!-[HMDAccessoryNameComposer roomNameAtEndSeparatedByWhitespace](v8, "roomNameAtEndSeparatedByWhitespace"))
            {
              -[HMDAccessoryNameComposer setRoomName:](v8, "setRoomName:", 0);
              goto LABEL_19;
            }
            goto LABEL_16;
          }
          v28 = v40 == 0;
LABEL_11:
          -[HMDAccessoryNameComposer accessoryName](v8, "accessoryName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "substringToIndex:", v22);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "rangeOfCharacterFromSet:options:", v33, 0);
          -[HMDAccessoryNameComposer setRoomNameAtEndSeparatedByWhitespace:](v8, "setRoomNameAtEndSeparatedByWhitespace:", v34 + v35 == v22);

          if (v28)
            goto LABEL_16;
          goto LABEL_15;
        }
        if (v25 == v27)
        {
          v28 = 0;
          goto LABEL_11;
        }
        -[HMDAccessoryNameComposer setRoomNameAtEndSeparatedByWhitespace:](v8, "setRoomNameAtEndSeparatedByWhitespace:", 0);
      }
    }
  }
LABEL_19:

  return v8;
}

- (NSString)composedString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[HMDAccessoryNameComposer roomName](self, "roomName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = -[HMDAccessoryNameComposer roomNameAtEndSeparatedByWhitespace](self, "roomNameAtEndSeparatedByWhitespace");
      v8 = (void *)MEMORY[0x24BDD17C8];
      HMDLocalizedStringForKey(CFSTR("ACCESSORY_NAME_COMPOSER_FORMAT"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v25 = 0;
        -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNameComposer roomName](self, "roomName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%1$@ %2$@"), &v25, v10, v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = v25;

        v14 = v12;
        if (!v12)
        {
          v15 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v27 = v17;
            v28 = 2112;
            v29 = CFSTR("ACCESSORY_NAME_COMPOSER_FORMAT");
            v30 = 2112;
            v31 = CFSTR("%1$@ %2$@");
            v32 = 2112;
            v33 = v13;
LABEL_13:
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            goto LABEL_14;
          }
          goto LABEL_14;
        }
      }
      else
      {
        v24 = 0;
        -[HMDAccessoryNameComposer roomName](self, "roomName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%1$@ %2$@"), &v24, v21, v22);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = v24;

        v14 = v12;
        if (!v12)
        {
          v15 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v27 = v17;
            v28 = 2112;
            v29 = CFSTR("ACCESSORY_NAME_COMPOSER_FORMAT");
            v30 = 2112;
            v31 = CFSTR("%1$@ %2$@");
            v32 = 2112;
            v33 = v13;
            goto LABEL_13;
          }
LABEL_14:

          objc_autoreleasePoolPop(v15);
          v14 = CFSTR("ACCESSORY_NAME_COMPOSER_FORMAT");
        }
      }
      v20 = v14;

      goto LABEL_16;
    }
  }
  else
  {

  }
  -[HMDAccessoryNameComposer roomName](self, "roomName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    -[HMDAccessoryNameComposer roomName](self, "roomName");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    v3 = v20;
  }
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDAccessoryNameComposer *v5;
  HMDAccessoryNameComposer *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDAccessoryNameComposer *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNameComposer accessoryName](v6, "accessoryName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNameComposer accessoryName](v6, "accessoryName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[HMDAccessoryNameComposer roomName](self, "roomName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNameComposer roomName](v6, "roomName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDAccessoryNameComposer roomName](self, "roomName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNameComposer roomName](v6, "roomName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryNameComposer accessoryName](self, "accessoryName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)rawAccessoryName
{
  return self->_rawAccessoryName;
}

- (void)setRawAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_rawAccessoryName, a3);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryName, a3);
}

- (NSString)rawRoomName
{
  return self->_rawRoomName;
}

- (void)setRawRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_rawRoomName, a3);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_roomName, a3);
}

- (BOOL)roomNameAtEndSeparatedByWhitespace
{
  return self->_roomNameAtEndSeparatedByWhitespace;
}

- (void)setRoomNameAtEndSeparatedByWhitespace:(BOOL)a3
{
  self->_roomNameAtEndSeparatedByWhitespace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_rawRoomName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_rawAccessoryName, 0);
}

@end
