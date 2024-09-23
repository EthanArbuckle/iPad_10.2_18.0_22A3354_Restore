@implementation CTLazuliCapabilitiesInformation

- (id)description
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliCapabilitiesInformation recipient](self, "recipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", recipient = %@"), v5);

  objc_msgSend(v4, "appendFormat:", CFSTR(", supportsVideoSharing = %d"), -[CTLazuliCapabilitiesInformation supportsVideoSharing](self, "supportsVideoSharing"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", supportsImageSharing = %d"), -[CTLazuliCapabilitiesInformation supportsImageSharing](self, "supportsImageSharing"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", supportsChat = %d"), -[CTLazuliCapabilitiesInformation supportsChat](self, "supportsChat"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", supportsFileTransfer = %d"), -[CTLazuliCapabilitiesInformation supportsFileTransfer](self, "supportsFileTransfer"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", supportsGeolocationCapabilities = %d"), -[CTLazuliCapabilitiesInformation supportsGeolocationCapabilities](self, "supportsGeolocationCapabilities"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", isBot = %d"), -[CTLazuliCapabilitiesInformation isBot](self, "isBot"));
  -[CTLazuliCapabilitiesInformation supportedLazuliExtensions](self, "supportedLazuliExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", supportedLazuliExtensions = %@"), v6);

  objc_msgSend(v4, "appendFormat:", CFSTR(", supportsFeature = %d"), -[CTLazuliCapabilitiesInformation supportsFeature](self, "supportsFeature"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", online = %d"), -[CTLazuliCapabilitiesInformation online](self, "online"));
  -[CTLazuliCapabilitiesInformation alternateIdentities](self, "alternateIdentities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", alternateIdentities = %@"), v7);

  -[CTLazuliCapabilitiesInformation validUntil](self, "validUntil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CTLazuliCapabilitiesInformation validUntil](self, "validUntil");
    self = (CTLazuliCapabilitiesInformation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTLazuliCapabilitiesInformation dateByAddingTimeInterval:](self, "dateByAddingTimeInterval:", (double)objc_msgSend(v2, "secondsFromGMT"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", validUntil = %@"), v9);
  if (v8)
  {

  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqualToCTLazuliCapabilitiesInformation:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  void *v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  v7 = a3;
  -[CTLazuliCapabilitiesInformation recipient](self, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToCTLazuliDestination:", v9))
  {
    v10 = -[CTLazuliCapabilitiesInformation supportsVideoSharing](self, "supportsVideoSharing");
    if (v10 == objc_msgSend(v7, "supportsVideoSharing"))
    {
      v11 = -[CTLazuliCapabilitiesInformation supportsImageSharing](self, "supportsImageSharing");
      if (v11 == objc_msgSend(v7, "supportsImageSharing"))
      {
        v12 = -[CTLazuliCapabilitiesInformation supportsChat](self, "supportsChat");
        if (v12 == objc_msgSend(v7, "supportsChat"))
        {
          v13 = -[CTLazuliCapabilitiesInformation supportsFileTransfer](self, "supportsFileTransfer");
          if (v13 == objc_msgSend(v7, "supportsFileTransfer"))
          {
            v14 = -[CTLazuliCapabilitiesInformation supportsGeolocationCapabilities](self, "supportsGeolocationCapabilities");
            if (v14 == objc_msgSend(v7, "supportsGeolocationCapabilities"))
            {
              v15 = -[CTLazuliCapabilitiesInformation isBot](self, "isBot");
              if (v15 == objc_msgSend(v7, "isBot"))
              {
                -[CTLazuliCapabilitiesInformation supportedLazuliExtensions](self, "supportedLazuliExtensions");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18
                  || (objc_msgSend(v7, "supportedLazuliExtensions"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[CTLazuliCapabilitiesInformation supportedLazuliExtensions](self, "supportedLazuliExtensions");
                  v4 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "supportedLazuliExtensions");
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
                  {

                    v16 = 0;
                    if (!v18)
                      goto LABEL_22;
                    goto LABEL_23;
                  }
                  v35 = v3;
                  LODWORD(v3) = 1;
                }
                else
                {
                  v35 = 0;
                }
                v19 = -[CTLazuliCapabilitiesInformation supportsFeature](self, "supportsFeature");
                if (v19 != objc_msgSend(v7, "supportsFeature")
                  || (v20 = -[CTLazuliCapabilitiesInformation online](self, "online"),
                      v20 != objc_msgSend(v7, "online")))
                {
                  v16 = 0;
                  if ((v3 & 1) == 0)
                    goto LABEL_21;
                  goto LABEL_20;
                }
                -[CTLazuliCapabilitiesInformation alternateIdentities](self, "alternateIdentities");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33
                  || (objc_msgSend(v7, "alternateIdentities"), (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[CTLazuliCapabilitiesInformation alternateIdentities](self, "alternateIdentities");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "alternateIdentities");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v34, "isEqualToCTLazuliAlternateIdentities:"))
                  {
                    v16 = 0;
                    goto LABEL_36;
                  }
                  v31 = 1;
                }
                else
                {
                  v29 = 0;
                  v31 = 0;
                }
                -[CTLazuliCapabilitiesInformation validUntil](self, "validUntil");
                v30 = objc_claimAutoreleasedReturnValue();
                if (v30 || (objc_msgSend(v7, "validUntil"), (v27 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[CTLazuliCapabilitiesInformation validUntil](self, "validUntil", v27, v29);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "timeIntervalSince1970");
                  v23 = v22;
                  objc_msgSend(v7, "validUntil");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "timeIntervalSince1970");
                  v16 = v23 == v25;

                  v26 = (void *)v30;
                  if (!v30)
                    v26 = v28;
                }
                else
                {
                  v26 = 0;
                  v16 = 1;
                }

                if ((v31 & 1) == 0)
                {
LABEL_37:
                  if (!v33)

                  if (!(_DWORD)v3)
                  {
LABEL_21:
                    v3 = v35;
                    if (!v18)
                    {
LABEL_22:

                      v18 = 0;
                    }
LABEL_23:

                    goto LABEL_9;
                  }
LABEL_20:

                  goto LABEL_21;
                }
LABEL_36:

                goto LABEL_37;
              }
            }
          }
        }
      }
    }
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliCapabilitiesInformation *v4;
  CTLazuliCapabilitiesInformation *v5;
  BOOL v6;

  v4 = (CTLazuliCapabilitiesInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliCapabilitiesInformation isEqualToCTLazuliCapabilitiesInformation:](self, "isEqualToCTLazuliCapabilitiesInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliCapabilitiesInformation *v4;

  v4 = +[CTLazuliCapabilitiesInformation allocWithZone:](CTLazuliCapabilitiesInformation, "allocWithZone:", a3);
  -[CTLazuliCapabilitiesInformation setRecipient:](v4, "setRecipient:", self->_recipient);
  -[CTLazuliCapabilitiesInformation setSupportsVideoSharing:](v4, "setSupportsVideoSharing:", self->_supportsVideoSharing);
  -[CTLazuliCapabilitiesInformation setSupportsImageSharing:](v4, "setSupportsImageSharing:", self->_supportsImageSharing);
  -[CTLazuliCapabilitiesInformation setSupportsChat:](v4, "setSupportsChat:", self->_supportsChat);
  -[CTLazuliCapabilitiesInformation setSupportsFileTransfer:](v4, "setSupportsFileTransfer:", self->_supportsFileTransfer);
  -[CTLazuliCapabilitiesInformation setSupportsGeolocationCapabilities:](v4, "setSupportsGeolocationCapabilities:", self->_supportsGeolocationCapabilities);
  -[CTLazuliCapabilitiesInformation setIsBot:](v4, "setIsBot:", self->_isBot);
  -[CTLazuliCapabilitiesInformation setSupportedLazuliExtensions:](v4, "setSupportedLazuliExtensions:", self->_supportedLazuliExtensions);
  -[CTLazuliCapabilitiesInformation setSupportsFeature:](v4, "setSupportsFeature:", self->_supportsFeature);
  -[CTLazuliCapabilitiesInformation setOnline:](v4, "setOnline:", self->_online);
  -[CTLazuliCapabilitiesInformation setAlternateIdentities:](v4, "setAlternateIdentities:", self->_alternateIdentities);
  -[CTLazuliCapabilitiesInformation setValidUntil:](v4, "setValidUntil:", self->_validUntil);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_recipient, CFSTR("kRecipientKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsVideoSharing, CFSTR("kSupportsVideoSharingKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsImageSharing, CFSTR("kSupportsImageSharingKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsChat, CFSTR("kSupportsChatKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsFileTransfer, CFSTR("kSupportsFileTransferKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsGeolocationCapabilities, CFSTR("kSupportsGeolocationCapabilitiesKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBot, CFSTR("kIsBotKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedLazuliExtensions, CFSTR("kSupportedLazuliExtensionsKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsFeature, CFSTR("kSupportsFeatureKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_online, CFSTR("kOnlineKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternateIdentities, CFSTR("kAlternateIdentitiesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_validUntil, CFSTR("kValidUntilKey"));

}

- (CTLazuliCapabilitiesInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliCapabilitiesInformation *v5;
  uint64_t v6;
  CTLazuliDestination *recipient;
  uint64_t v8;
  NSString *supportedLazuliExtensions;
  uint64_t v10;
  CTLazuliAlternateIdentities *alternateIdentities;
  uint64_t v12;
  NSDate *validUntil;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliCapabilitiesInformation;
  v5 = -[CTLazuliCapabilitiesInformation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRecipientKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    recipient = v5->_recipient;
    v5->_recipient = (CTLazuliDestination *)v6;

    v5->_supportsVideoSharing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsVideoSharingKey"));
    v5->_supportsImageSharing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsImageSharingKey"));
    v5->_supportsChat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsChatKey"));
    v5->_supportsFileTransfer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsFileTransferKey"));
    v5->_supportsGeolocationCapabilities = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsGeolocationCapabilitiesKey"));
    v5->_isBot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsBotKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSupportedLazuliExtensionsKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    supportedLazuliExtensions = v5->_supportedLazuliExtensions;
    v5->_supportedLazuliExtensions = (NSString *)v8;

    v5->_supportsFeature = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSupportsFeatureKey"));
    v5->_online = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kOnlineKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAlternateIdentitiesKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    alternateIdentities = v5->_alternateIdentities;
    v5->_alternateIdentities = (CTLazuliAlternateIdentities *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kValidUntilKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSDate *)v12;

  }
  return v5;
}

- (CTLazuliCapabilitiesInformation)initWithReflection:(const void *)a3
{
  CTLazuliCapabilitiesInformation *v4;
  CTLazuliDestination *v5;
  CTLazuliDestination *recipient;
  char *v7;
  uint64_t v8;
  NSString *supportedLazuliExtensions;
  CTLazuliAlternateIdentities *v10;
  uint64_t v11;
  CTLazuliAlternateIdentities *alternateIdentities;
  uint64_t v13;
  NSDate *validUntil;
  CTLazuliCapabilitiesInformation *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CTLazuliCapabilitiesInformation;
  v4 = -[CTLazuliCapabilitiesInformation init](&v16, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliDestination initWithReflection:]([CTLazuliDestination alloc], "initWithReflection:", a3);
  recipient = v4->_recipient;
  v4->_recipient = v5;

  v4->_supportsVideoSharing = *((_BYTE *)a3 + 112);
  v4->_supportsImageSharing = *((_BYTE *)a3 + 113);
  v4->_supportsChat = *((_BYTE *)a3 + 114);
  v4->_supportsFileTransfer = *((_BYTE *)a3 + 115);
  v4->_supportsGeolocationCapabilities = *((_BYTE *)a3 + 116);
  v4->_isBot = *((_BYTE *)a3 + 117);
  if (*((_BYTE *)a3 + 144))
  {
    if (*((char *)a3 + 143) >= 0)
      v7 = (char *)a3 + 120;
    else
      v7 = (char *)*((_QWORD *)a3 + 15);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    supportedLazuliExtensions = v4->_supportedLazuliExtensions;
    v4->_supportedLazuliExtensions = (NSString *)v8;
  }
  else
  {
    supportedLazuliExtensions = v4->_supportedLazuliExtensions;
    v4->_supportedLazuliExtensions = 0;
  }

  v4->_supportsFeature = *((_BYTE *)a3 + 152);
  v4->_online = *((_BYTE *)a3 + 153);
  if (!*((_BYTE *)a3 + 184))
  {
    alternateIdentities = v4->_alternateIdentities;
    v4->_alternateIdentities = 0;
    goto LABEL_12;
  }
  v10 = [CTLazuliAlternateIdentities alloc];
  if (*((_BYTE *)a3 + 184))
  {
    v11 = -[CTLazuliAlternateIdentities initWithReflection:](v10, "initWithReflection:", (char *)a3 + 160);
    alternateIdentities = v4->_alternateIdentities;
    v4->_alternateIdentities = (CTLazuliAlternateIdentities *)v11;
LABEL_12:

    if (*((_BYTE *)a3 + 200))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", *((double *)a3 + 24));
      v13 = objc_claimAutoreleasedReturnValue();
      validUntil = v4->_validUntil;
      v4->_validUntil = (NSDate *)v13;
    }
    else
    {
      validUntil = v4->_validUntil;
      v4->_validUntil = 0;
    }

    return v4;
  }
  result = (CTLazuliCapabilitiesInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliDestination)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (BOOL)supportsVideoSharing
{
  return self->_supportsVideoSharing;
}

- (void)setSupportsVideoSharing:(BOOL)a3
{
  self->_supportsVideoSharing = a3;
}

- (BOOL)supportsImageSharing
{
  return self->_supportsImageSharing;
}

- (void)setSupportsImageSharing:(BOOL)a3
{
  self->_supportsImageSharing = a3;
}

- (BOOL)supportsChat
{
  return self->_supportsChat;
}

- (void)setSupportsChat:(BOOL)a3
{
  self->_supportsChat = a3;
}

- (BOOL)supportsFileTransfer
{
  return self->_supportsFileTransfer;
}

- (void)setSupportsFileTransfer:(BOOL)a3
{
  self->_supportsFileTransfer = a3;
}

- (BOOL)supportsGeolocationCapabilities
{
  return self->_supportsGeolocationCapabilities;
}

- (void)setSupportsGeolocationCapabilities:(BOOL)a3
{
  self->_supportsGeolocationCapabilities = a3;
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (void)setIsBot:(BOOL)a3
{
  self->_isBot = a3;
}

- (NSString)supportedLazuliExtensions
{
  return self->_supportedLazuliExtensions;
}

- (void)setSupportedLazuliExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_supportedLazuliExtensions, a3);
}

- (BOOL)supportsFeature
{
  return self->_supportsFeature;
}

- (void)setSupportsFeature:(BOOL)a3
{
  self->_supportsFeature = a3;
}

- (BOOL)online
{
  return self->_online;
}

- (void)setOnline:(BOOL)a3
{
  self->_online = a3;
}

- (CTLazuliAlternateIdentities)alternateIdentities
{
  return self->_alternateIdentities;
}

- (void)setAlternateIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_alternateIdentities, a3);
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
  objc_storeStrong((id *)&self->_validUntil, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_alternateIdentities, 0);
  objc_storeStrong((id *)&self->_supportedLazuliExtensions, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
