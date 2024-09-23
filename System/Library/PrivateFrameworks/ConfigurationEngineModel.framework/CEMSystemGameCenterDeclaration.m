@implementation CEMSystemGameCenterDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.gamecenter");
}

+ (id)profileType
{
  return &stru_24C63AAC0;
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowGameCenter");
  v6[1] = CFSTR("allowMultiplayerGaming");
  v6[2] = CFSTR("allowAddingGameCenterFriends");
  v6[3] = CFSTR("allowGameCenterNearbyMultiplayer");
  v6[4] = CFSTR("allowGameCenterPrivateMessaging");
  v6[5] = CFSTR("allowGameCenterProfilePrivacyModification");
  v6[6] = CFSTR("allowGameCenterProfileModification");
  v6[7] = CFSTR("allowedGameCenterOtherPlayerTypes");
  v6[8] = CFSTR("allowGameCenterFriendsSharingModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowGameCenter");
  v6[1] = CFSTR("allowMultiplayerGaming");
  v6[2] = CFSTR("allowAddingGameCenterFriends");
  v6[3] = CFSTR("allowGameCenterNearbyMultiplayer");
  v6[4] = CFSTR("allowGameCenterPrivateMessaging");
  v6[5] = CFSTR("allowGameCenterProfilePrivacyModification");
  v6[6] = CFSTR("allowGameCenterProfileModification");
  v6[7] = CFSTR("allowedGameCenterOtherPlayerTypes");
  v6[8] = CFSTR("allowGameCenterFriendsSharingModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withAllowGameCenter:(id)a4 withAllowMultiplayerGaming:(id)a5 withAllowAddingGameCenterFriends:(id)a6 withAllowGameCenterNearbyMultiplayer:(id)a7 withAllowGameCenterPrivateMessaging:(id)a8 withAllowGameCenterProfilePrivacyModification:(id)a9 withAllowGameCenterProfileModification:(id)a10 withAllowedGameCenterOtherPlayerTypes:(id)a11 withAllowGameCenterFriendsSharingModification:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v39;
  id v40;

  v16 = a3;
  v40 = a12;
  v39 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setDeclarationType:", CFSTR("com.apple.configuration.system.gamecenter"));
  if (v16)
  {
    objc_msgSend(v24, "setDeclarationIdentifier:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDeclarationIdentifier:", v26);

    v16 = 0;
  }
  v27 = (void *)MEMORY[0x24BDBD1C8];
  if (v23)
    v28 = v23;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v24, "setPayloadAllowGameCenter:", v28);

  if (v22)
    v29 = v22;
  else
    v29 = v27;
  objc_msgSend(v24, "setPayloadAllowMultiplayerGaming:", v29);

  if (v21)
    v30 = v21;
  else
    v30 = v27;
  objc_msgSend(v24, "setPayloadAllowAddingGameCenterFriends:", v30);

  if (v20)
    v31 = v20;
  else
    v31 = v27;
  objc_msgSend(v24, "setPayloadAllowGameCenterNearbyMultiplayer:", v31);

  if (v19)
    v32 = v19;
  else
    v32 = v27;
  objc_msgSend(v24, "setPayloadAllowGameCenterPrivateMessaging:", v32);

  if (v18)
    v33 = v18;
  else
    v33 = v27;
  objc_msgSend(v24, "setPayloadAllowGameCenterProfilePrivacyModification:", v33);

  if (v17)
    v34 = v17;
  else
    v34 = v27;
  objc_msgSend(v24, "setPayloadAllowGameCenterProfileModification:", v34);

  if (v39)
    v35 = v39;
  else
    v35 = &unk_24C69CE60;
  objc_msgSend(v24, "setPayloadAllowedGameCenterOtherPlayerTypes:", v35);

  if (v40)
    v36 = v40;
  else
    v36 = v27;
  objc_msgSend(v24, "setPayloadAllowGameCenterFriendsSharingModification:", v36);

  objc_msgSend(v24, "updateServerHash");
  return v24;
}

+ (id)buildWithIdentifier:(id)a3 withAllowGameCenter:(id)a4 withAllowMultiplayerGaming:(id)a5 withAllowAddingGameCenterFriends:(id)a6 withAllowGameCenterNearbyMultiplayer:(id)a7 withAllowGameCenterPrivateMessaging:(id)a8 withAllowGameCenterProfilePrivacyModification:(id)a9 withAllowGameCenterProfileModification:(id)a10 withAllowedGameCenterOtherPlayerTypes:(id)a11
{
  return +[CEMSystemGameCenterDeclaration buildWithIdentifier:withAllowGameCenter:withAllowMultiplayerGaming:withAllowAddingGameCenterFriends:withAllowGameCenterNearbyMultiplayer:withAllowGameCenterPrivateMessaging:withAllowGameCenterProfilePrivacyModification:withAllowGameCenterProfileModification:withAllowedGameCenterOtherPlayerTypes:withAllowGameCenterFriendsSharingModification:](CEMSystemGameCenterDeclaration, "buildWithIdentifier:withAllowGameCenter:withAllowMultiplayerGaming:withAllowAddingGameCenterFriends:withAllowGameCenterNearbyMultiplayer:withAllowGameCenterPrivateMessaging:withAllowGameCenterProfilePrivacyModification:withAllowGameCenterProfileModification:withAllowedGameCenterOtherPlayerTypes:withAllowGameCenterFriendsSharingModification:", a3, a4, a5, a6, 0, 0, 0, 0, 0, MEMORY[0x24BDBD1C8]);
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.gamecenter"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSNumber *v13;
  id v14;
  NSNumber *payloadAllowGameCenter;
  NSNumber *v16;
  NSNumber *payloadAllowMultiplayerGaming;
  NSNumber *v18;
  NSNumber *payloadAllowAddingGameCenterFriends;
  NSNumber *v20;
  NSNumber *payloadAllowGameCenterNearbyMultiplayer;
  NSNumber *v22;
  NSNumber *payloadAllowGameCenterPrivateMessaging;
  NSNumber *v24;
  NSNumber *payloadAllowGameCenterProfilePrivacyModification;
  NSNumber *v26;
  NSNumber *payloadAllowGameCenterProfileModification;
  NSNumber *v28;
  NSNumber *payloadAllowedGameCenterOtherPlayerTypes;
  NSNumber *v30;
  NSNumber *payloadAllowGameCenterFriendsSharingModification;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemGameCenterDeclaration allowedPayloadKeys](CEMSystemGameCenterDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v41 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGameCenter"), 0, MEMORY[0x24BDBD1C8], &v41);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v41;
  payloadAllowGameCenter = self->_payloadAllowGameCenter;
  self->_payloadAllowGameCenter = v13;

  if (!v14)
  {
    v40 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowMultiplayerGaming"), 0, MEMORY[0x24BDBD1C8], &v40);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    payloadAllowMultiplayerGaming = self->_payloadAllowMultiplayerGaming;
    self->_payloadAllowMultiplayerGaming = v16;

    if (!v14)
    {
      v39 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAddingGameCenterFriends"), 0, MEMORY[0x24BDBD1C8], &v39);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v39;
      payloadAllowAddingGameCenterFriends = self->_payloadAllowAddingGameCenterFriends;
      self->_payloadAllowAddingGameCenterFriends = v18;

      if (!v14)
      {
        v38 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGameCenterNearbyMultiplayer"), 0, MEMORY[0x24BDBD1C8], &v38);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v38;
        payloadAllowGameCenterNearbyMultiplayer = self->_payloadAllowGameCenterNearbyMultiplayer;
        self->_payloadAllowGameCenterNearbyMultiplayer = v20;

        if (!v14)
        {
          v37 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGameCenterPrivateMessaging"), 0, MEMORY[0x24BDBD1C8], &v37);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v37;
          payloadAllowGameCenterPrivateMessaging = self->_payloadAllowGameCenterPrivateMessaging;
          self->_payloadAllowGameCenterPrivateMessaging = v22;

          if (!v14)
          {
            v36 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGameCenterProfilePrivacyModification"), 0, MEMORY[0x24BDBD1C8], &v36);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v36;
            payloadAllowGameCenterProfilePrivacyModification = self->_payloadAllowGameCenterProfilePrivacyModification;
            self->_payloadAllowGameCenterProfilePrivacyModification = v24;

            if (!v14)
            {
              v35 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGameCenterProfileModification"), 0, MEMORY[0x24BDBD1C8], &v35);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v35;
              payloadAllowGameCenterProfileModification = self->_payloadAllowGameCenterProfileModification;
              self->_payloadAllowGameCenterProfileModification = v26;

              if (!v14)
              {
                v34 = 0;
                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowedGameCenterOtherPlayerTypes"), 0, &unk_24C69CE60, &v34);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v34;
                payloadAllowedGameCenterOtherPlayerTypes = self->_payloadAllowedGameCenterOtherPlayerTypes;
                self->_payloadAllowedGameCenterOtherPlayerTypes = v28;

                if (!v14)
                {
                  v33 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGameCenterFriendsSharingModification"), 0, MEMORY[0x24BDBD1C8], &v33);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v33;
                  payloadAllowGameCenterFriendsSharingModification = self->_payloadAllowGameCenterFriendsSharingModification;
                  self->_payloadAllowGameCenterFriendsSharingModification = v30;

                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGameCenter"), self->_payloadAllowGameCenter, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowMultiplayerGaming"), self->_payloadAllowMultiplayerGaming, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAddingGameCenterFriends"), self->_payloadAllowAddingGameCenterFriends, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGameCenterNearbyMultiplayer"), self->_payloadAllowGameCenterNearbyMultiplayer, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGameCenterPrivateMessaging"), self->_payloadAllowGameCenterPrivateMessaging, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGameCenterProfilePrivacyModification"), self->_payloadAllowGameCenterProfilePrivacyModification, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGameCenterProfileModification"), self->_payloadAllowGameCenterProfileModification, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowedGameCenterOtherPlayerTypes"), self->_payloadAllowedGameCenterOtherPlayerTypes, 0, &unk_24C69CE60);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGameCenterFriendsSharingModification"), self->_payloadAllowGameCenterFriendsSharingModification, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CEMSystemGameCenterDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v24, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowGameCenter, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowMultiplayerGaming, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowAddingGameCenterFriends, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowGameCenterNearbyMultiplayer, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowGameCenterPrivateMessaging, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowGameCenterProfilePrivacyModification, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowGameCenterProfileModification, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadAllowedGameCenterOtherPlayerTypes, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadAllowGameCenterFriendsSharingModification, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  return v4;
}

- (NSNumber)payloadAllowGameCenter
{
  return self->_payloadAllowGameCenter;
}

- (void)setPayloadAllowGameCenter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowMultiplayerGaming
{
  return self->_payloadAllowMultiplayerGaming;
}

- (void)setPayloadAllowMultiplayerGaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowAddingGameCenterFriends
{
  return self->_payloadAllowAddingGameCenterFriends;
}

- (void)setPayloadAllowAddingGameCenterFriends:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowGameCenterNearbyMultiplayer
{
  return self->_payloadAllowGameCenterNearbyMultiplayer;
}

- (void)setPayloadAllowGameCenterNearbyMultiplayer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowGameCenterPrivateMessaging
{
  return self->_payloadAllowGameCenterPrivateMessaging;
}

- (void)setPayloadAllowGameCenterPrivateMessaging:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowGameCenterProfilePrivacyModification
{
  return self->_payloadAllowGameCenterProfilePrivacyModification;
}

- (void)setPayloadAllowGameCenterProfilePrivacyModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowGameCenterProfileModification
{
  return self->_payloadAllowGameCenterProfileModification;
}

- (void)setPayloadAllowGameCenterProfileModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadAllowedGameCenterOtherPlayerTypes
{
  return self->_payloadAllowedGameCenterOtherPlayerTypes;
}

- (void)setPayloadAllowedGameCenterOtherPlayerTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadAllowGameCenterFriendsSharingModification
{
  return self->_payloadAllowGameCenterFriendsSharingModification;
}

- (void)setPayloadAllowGameCenterFriendsSharingModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowGameCenterFriendsSharingModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowedGameCenterOtherPlayerTypes, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterProfileModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterProfilePrivacyModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterPrivateMessaging, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterNearbyMultiplayer, 0);
  objc_storeStrong((id *)&self->_payloadAllowAddingGameCenterFriends, 0);
  objc_storeStrong((id *)&self->_payloadAllowMultiplayerGaming, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenter, 0);
}

@end
