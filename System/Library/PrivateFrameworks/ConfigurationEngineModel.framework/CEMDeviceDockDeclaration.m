@implementation CEMDeviceDockDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.device.dock");
}

+ (id)profileType
{
  return CFSTR("com.apple.dock");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[28];

  v6[27] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("orientation");
  v6[1] = CFSTR("position-immutable");
  v6[2] = CFSTR("autohide");
  v6[3] = CFSTR("autohide-immutable");
  v6[4] = CFSTR("minimize-to-application");
  v6[5] = CFSTR("minimize-to-application-immutable");
  v6[6] = CFSTR("magnification");
  v6[7] = CFSTR("magnify-immutable");
  v6[8] = CFSTR("largesize");
  v6[9] = CFSTR("magsize-immutable");
  v6[10] = CFSTR("show-process-indicators");
  v6[11] = CFSTR("launchanim");
  v6[12] = CFSTR("launchanim-immutable");
  v6[13] = CFSTR("mineffect");
  v6[14] = CFSTR("mineffect-immutable");
  v6[15] = CFSTR("tilesize");
  v6[16] = CFSTR("size-immutable");
  v6[17] = CFSTR("MCXDockSpecialFolders");
  v6[18] = CFSTR("AllowDockFixupOverride");
  v6[19] = CFSTR("static-only");
  v6[20] = CFSTR("static-others");
  v6[21] = CFSTR("static-apps");
  v6[22] = CFSTR("contents-immutable");
  v6[23] = CFSTR("windowtabbing-immutable");
  v6[24] = CFSTR("dblclickbehavior-immutable");
  v6[25] = CFSTR("showindicators-immutable");
  v6[26] = CFSTR("show-recents");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
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

+ (id)buildWithIdentifier:(id)a3 withOrientation:(id)a4 withPositionImmutable:(id)a5 withAutohide:(id)a6 withAutohideImmutable:(id)a7 withMinimizeToApplication:(id)a8 withMinimizeToApplicationImmutable:(id)a9 withMagnification:(id)a10 withMagnifyImmutable:(id)a11 withLargesize:(id)a12 withMagsizeImmutable:(id)a13 withShowProcessIndicators:(id)a14 withLaunchanim:(id)a15 withLaunchanimImmutable:(id)a16 withMineffect:(id)a17 withMineffectImmutable:(id)a18 withTilesize:(id)a19 withSizeImmutable:(id)a20 withMCXDockSpecialFolders:(id)a21 withAllowDockFixupOverride:(id)a22 withStaticOnly:(id)a23 withStaticOthers:(id)a24 withStaticApps:(id)a25 withContentsImmutable:(id)a26 withWindowtabbingImmutable:(id)a27 withDblclickbehaviorImmutable:(id)a28 withShowindicatorsImmutable:(id)a29 withShowRecents:(id)a30
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  id v59;
  id v60;
  id v61;
  id v63;
  id v66;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;

  v30 = a3;
  v87 = a30;
  v86 = a29;
  v85 = a28;
  v31 = a27;
  v84 = a26;
  v83 = a25;
  v82 = a24;
  v81 = a23;
  v80 = a22;
  v79 = a21;
  v78 = a20;
  v77 = a19;
  v76 = a18;
  v75 = a17;
  v74 = a16;
  v73 = a15;
  v72 = a14;
  v71 = a13;
  v70 = a12;
  v66 = a11;
  v63 = a10;
  v32 = a9;
  v33 = a8;
  v34 = a7;
  v35 = a6;
  v36 = a5;
  v37 = a4;
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setDeclarationType:", CFSTR("com.apple.configuration.device.dock"));
  if (v30)
  {
    objc_msgSend(v38, "setDeclarationIdentifier:", v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDeclarationIdentifier:", v40);

    v30 = 0;
  }
  objc_msgSend(v38, "setPayloadOrientation:", v37, a9);

  v41 = (void *)MEMORY[0x24BDBD1C0];
  if (v36)
    v42 = v36;
  else
    v42 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v38, "setPayloadPositionImmutable:", v42);

  if (v35)
    v43 = v35;
  else
    v43 = v41;
  objc_msgSend(v38, "setPayloadAutohide:", v43);

  if (v34)
    v44 = v34;
  else
    v44 = v41;
  objc_msgSend(v38, "setPayloadAutohideImmutable:", v44);

  if (v33)
    v45 = v33;
  else
    v45 = v41;
  objc_msgSend(v38, "setPayloadMinimizeToApplication:", v45);

  if (v32)
    v46 = v32;
  else
    v46 = v41;
  objc_msgSend(v38, "setPayloadMinimizeToApplicationImmutable:", v46);

  if (v63)
    v47 = v63;
  else
    v47 = v41;
  objc_msgSend(v38, "setPayloadMagnification:", v47);

  if (v66)
    v48 = v66;
  else
    v48 = v41;
  objc_msgSend(v38, "setPayloadMagnifyImmutable:", v48);

  objc_msgSend(v38, "setPayloadLargesize:", v70);
  if (v71)
    v49 = v71;
  else
    v49 = v41;
  objc_msgSend(v38, "setPayloadMagsizeImmutable:", v49);

  if (v72)
    v50 = v72;
  else
    v50 = v41;
  objc_msgSend(v38, "setPayloadShowProcessIndicators:", v50);

  if (v73)
    v51 = v73;
  else
    v51 = v41;
  objc_msgSend(v38, "setPayloadLaunchanim:", v51);

  if (v74)
    v52 = v74;
  else
    v52 = v41;
  objc_msgSend(v38, "setPayloadLaunchanimImmutable:", v52);

  objc_msgSend(v38, "setPayloadMineffect:", v75);
  if (v76)
    v53 = v76;
  else
    v53 = v41;
  objc_msgSend(v38, "setPayloadMineffectImmutable:", v53);

  objc_msgSend(v38, "setPayloadTilesize:", v77);
  if (v78)
    v54 = v78;
  else
    v54 = v41;
  objc_msgSend(v38, "setPayloadSizeImmutable:", v54);

  objc_msgSend(v38, "setPayloadMCXDockSpecialFolders:", v79);
  if (v80)
    v55 = v80;
  else
    v55 = v41;
  objc_msgSend(v38, "setPayloadAllowDockFixupOverride:", v55);

  if (v81)
    v56 = v81;
  else
    v56 = v41;
  objc_msgSend(v38, "setPayloadStaticOnly:", v56);

  objc_msgSend(v38, "setPayloadStaticOthers:", v82);
  objc_msgSend(v38, "setPayloadStaticApps:", v83);

  if (v84)
    v57 = v84;
  else
    v57 = v41;
  objc_msgSend(v38, "setPayloadContentsImmutable:", v57);

  if (v31)
    v58 = v31;
  else
    v58 = v41;
  objc_msgSend(v38, "setPayloadWindowtabbingImmutable:", v58);

  if (v85)
    v59 = v85;
  else
    v59 = v41;
  objc_msgSend(v38, "setPayloadDblclickbehaviorImmutable:", v59);

  if (v86)
    v60 = v86;
  else
    v60 = v41;
  objc_msgSend(v38, "setPayloadShowindicatorsImmutable:", v60);

  if (v87)
    v61 = v87;
  else
    v61 = v41;
  objc_msgSend(v38, "setPayloadShowRecents:", v61);

  objc_msgSend(v38, "updateServerHash");
  return v38;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.device.dock"));
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
  NSString *v13;
  id v14;
  NSString *payloadOrientation;
  NSNumber *v16;
  NSNumber *payloadPositionImmutable;
  NSNumber *v18;
  NSNumber *payloadAutohide;
  NSNumber *v20;
  NSNumber *payloadAutohideImmutable;
  NSNumber *v22;
  NSNumber *payloadMinimizeToApplication;
  NSNumber *v24;
  NSNumber *payloadMinimizeToApplicationImmutable;
  NSNumber *v26;
  NSNumber *payloadMagnification;
  NSNumber *v28;
  NSNumber *payloadMagnifyImmutable;
  NSNumber *v30;
  NSNumber *payloadLargesize;
  NSNumber *v32;
  NSNumber *payloadMagsizeImmutable;
  NSNumber *v34;
  NSNumber *payloadShowProcessIndicators;
  NSNumber *v36;
  NSNumber *payloadLaunchanim;
  NSNumber *v38;
  NSNumber *payloadLaunchanimImmutable;
  NSString *v40;
  NSString *payloadMineffect;
  NSNumber *v42;
  NSNumber *payloadMineffectImmutable;
  NSNumber *v44;
  NSNumber *payloadTilesize;
  NSNumber *v46;
  NSNumber *payloadSizeImmutable;
  NSArray *v48;
  NSArray *payloadMCXDockSpecialFolders;
  NSNumber *v50;
  NSNumber *payloadAllowDockFixupOverride;
  NSNumber *v52;
  NSNumber *payloadStaticOnly;
  NSArray *v54;
  NSArray *payloadStaticOthers;
  NSArray *v56;
  NSArray *payloadStaticApps;
  NSNumber *v58;
  NSNumber *payloadContentsImmutable;
  NSNumber *v60;
  NSNumber *payloadWindowtabbingImmutable;
  NSNumber *v62;
  NSNumber *payloadDblclickbehaviorImmutable;
  NSNumber *v64;
  NSNumber *payloadShowindicatorsImmutable;
  NSNumber *v66;
  NSNumber *payloadShowRecents;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceDockDeclaration allowedPayloadKeys](CEMDeviceDockDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v95 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("orientation"), 0, 0, &v95);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v95;
  payloadOrientation = self->_payloadOrientation;
  self->_payloadOrientation = v13;

  if (!v14)
  {
    v94 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("position-immutable"), 0, MEMORY[0x24BDBD1C0], &v94);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v94;
    payloadPositionImmutable = self->_payloadPositionImmutable;
    self->_payloadPositionImmutable = v16;

    if (!v14)
    {
      v93 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("autohide"), 0, MEMORY[0x24BDBD1C0], &v93);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v93;
      payloadAutohide = self->_payloadAutohide;
      self->_payloadAutohide = v18;

      if (!v14)
      {
        v92 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("autohide-immutable"), 0, MEMORY[0x24BDBD1C0], &v92);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v92;
        payloadAutohideImmutable = self->_payloadAutohideImmutable;
        self->_payloadAutohideImmutable = v20;

        if (!v14)
        {
          v91 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("minimize-to-application"), 0, MEMORY[0x24BDBD1C0], &v91);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v91;
          payloadMinimizeToApplication = self->_payloadMinimizeToApplication;
          self->_payloadMinimizeToApplication = v22;

          if (!v14)
          {
            v90 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("minimize-to-application-immutable"), 0, MEMORY[0x24BDBD1C0], &v90);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v90;
            payloadMinimizeToApplicationImmutable = self->_payloadMinimizeToApplicationImmutable;
            self->_payloadMinimizeToApplicationImmutable = v24;

            if (!v14)
            {
              v89 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("magnification"), 0, MEMORY[0x24BDBD1C0], &v89);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v89;
              payloadMagnification = self->_payloadMagnification;
              self->_payloadMagnification = v26;

              if (!v14)
              {
                v88 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("magnify-immutable"), 0, MEMORY[0x24BDBD1C0], &v88);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v88;
                payloadMagnifyImmutable = self->_payloadMagnifyImmutable;
                self->_payloadMagnifyImmutable = v28;

                if (!v14)
                {
                  v87 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("largesize"), 0, 0, &v87);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v87;
                  payloadLargesize = self->_payloadLargesize;
                  self->_payloadLargesize = v30;

                  if (!v14)
                  {
                    v86 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("magsize-immutable"), 0, MEMORY[0x24BDBD1C0], &v86);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v86;
                    payloadMagsizeImmutable = self->_payloadMagsizeImmutable;
                    self->_payloadMagsizeImmutable = v32;

                    if (!v14)
                    {
                      v85 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("show-process-indicators"), 0, MEMORY[0x24BDBD1C0], &v85);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v85;
                      payloadShowProcessIndicators = self->_payloadShowProcessIndicators;
                      self->_payloadShowProcessIndicators = v34;

                      if (!v14)
                      {
                        v84 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("launchanim"), 0, MEMORY[0x24BDBD1C0], &v84);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v84;
                        payloadLaunchanim = self->_payloadLaunchanim;
                        self->_payloadLaunchanim = v36;

                        if (!v14)
                        {
                          v83 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("launchanim-immutable"), 0, MEMORY[0x24BDBD1C0], &v83);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v83;
                          payloadLaunchanimImmutable = self->_payloadLaunchanimImmutable;
                          self->_payloadLaunchanimImmutable = v38;

                          if (!v14)
                          {
                            v82 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("mineffect"), 0, 0, &v82);
                            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v14 = v82;
                            payloadMineffect = self->_payloadMineffect;
                            self->_payloadMineffect = v40;

                            if (!v14)
                            {
                              v81 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("mineffect-immutable"), 0, MEMORY[0x24BDBD1C0], &v81);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v81;
                              payloadMineffectImmutable = self->_payloadMineffectImmutable;
                              self->_payloadMineffectImmutable = v42;

                              if (!v14)
                              {
                                v80 = 0;
                                -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("tilesize"), 0, 0, &v80);
                                v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v14 = v80;
                                payloadTilesize = self->_payloadTilesize;
                                self->_payloadTilesize = v44;

                                if (!v14)
                                {
                                  v79 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("size-immutable"), 0, MEMORY[0x24BDBD1C0], &v79);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v79;
                                  payloadSizeImmutable = self->_payloadSizeImmutable;
                                  self->_payloadSizeImmutable = v46;

                                  if (!v14)
                                  {
                                    v78 = 0;
                                    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("MCXDockSpecialFolders"), &__block_literal_global_11, 0, 0, &v78);
                                    v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                    v14 = v78;
                                    payloadMCXDockSpecialFolders = self->_payloadMCXDockSpecialFolders;
                                    self->_payloadMCXDockSpecialFolders = v48;

                                    if (!v14)
                                    {
                                      v77 = 0;
                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowDockFixupOverride"), 0, MEMORY[0x24BDBD1C0], &v77);
                                      v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                      v14 = v77;
                                      payloadAllowDockFixupOverride = self->_payloadAllowDockFixupOverride;
                                      self->_payloadAllowDockFixupOverride = v50;

                                      if (!v14)
                                      {
                                        v76 = 0;
                                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("static-only"), 0, MEMORY[0x24BDBD1C0], &v76);
                                        v52 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                        v14 = v76;
                                        payloadStaticOnly = self->_payloadStaticOnly;
                                        self->_payloadStaticOnly = v52;

                                        if (!v14)
                                        {
                                          v75 = 0;
                                          -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("static-others"), objc_opt_class(), 0, 0, 0, &v75);
                                          v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                          v14 = v75;
                                          payloadStaticOthers = self->_payloadStaticOthers;
                                          self->_payloadStaticOthers = v54;

                                          if (!v14)
                                          {
                                            v74 = 0;
                                            -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("static-apps"), objc_opt_class(), 0, 0, 0, &v74);
                                            v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
                                            v14 = v74;
                                            payloadStaticApps = self->_payloadStaticApps;
                                            self->_payloadStaticApps = v56;

                                            if (!v14)
                                            {
                                              v73 = 0;
                                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("contents-immutable"), 0, MEMORY[0x24BDBD1C0], &v73);
                                              v58 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                              v14 = v73;
                                              payloadContentsImmutable = self->_payloadContentsImmutable;
                                              self->_payloadContentsImmutable = v58;

                                              if (!v14)
                                              {
                                                v72 = 0;
                                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("windowtabbing-immutable"), 0, MEMORY[0x24BDBD1C0], &v72);
                                                v60 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                v14 = v72;
                                                payloadWindowtabbingImmutable = self->_payloadWindowtabbingImmutable;
                                                self->_payloadWindowtabbingImmutable = v60;

                                                if (!v14)
                                                {
                                                  v71 = 0;
                                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("dblclickbehavior-immutable"), 0, MEMORY[0x24BDBD1C0], &v71);
                                                  v62 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                  v14 = v71;
                                                  payloadDblclickbehaviorImmutable = self->_payloadDblclickbehaviorImmutable;
                                                  self->_payloadDblclickbehaviorImmutable = v62;

                                                  if (!v14)
                                                  {
                                                    v70 = 0;
                                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("showindicators-immutable"), 0, MEMORY[0x24BDBD1C0], &v70);
                                                    v64 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                    v14 = v70;
                                                    payloadShowindicatorsImmutable = self->_payloadShowindicatorsImmutable;
                                                    self->_payloadShowindicatorsImmutable = v64;

                                                    if (!v14)
                                                    {
                                                      v69 = 0;
                                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("show-recents"), 0, MEMORY[0x24BDBD1C0], &v69);
                                                      v66 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                                      v14 = v69;
                                                      payloadShowRecents = self->_payloadShowRecents;
                                                      self->_payloadShowRecents = v66;

                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
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

uint64_t __46__CEMDeviceDockDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSArray *payloadStaticOthers;
  uint64_t v8;
  id v9;
  NSArray *payloadStaticApps;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("orientation"), self->_payloadOrientation, 0, 0);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("position-immutable"), self->_payloadPositionImmutable, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("autohide"), self->_payloadAutohide, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("autohide-immutable"), self->_payloadAutohideImmutable, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("minimize-to-application"), self->_payloadMinimizeToApplication, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("minimize-to-application-immutable"), self->_payloadMinimizeToApplicationImmutable, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("magnification"), self->_payloadMagnification, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("magnify-immutable"), self->_payloadMagnifyImmutable, 0, v6);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("largesize"), self->_payloadLargesize, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("magsize-immutable"), self->_payloadMagsizeImmutable, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("show-process-indicators"), self->_payloadShowProcessIndicators, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("launchanim"), self->_payloadLaunchanim, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("launchanim-immutable"), self->_payloadLaunchanimImmutable, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("mineffect"), self->_payloadMineffect, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("mineffect-immutable"), self->_payloadMineffectImmutable, 0, v6);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("tilesize"), self->_payloadTilesize, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("size-immutable"), self->_payloadSizeImmutable, 0, v6);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("MCXDockSpecialFolders"), self->_payloadMCXDockSpecialFolders, &__block_literal_global_78, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AllowDockFixupOverride"), self->_payloadAllowDockFixupOverride, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("static-only"), self->_payloadStaticOnly, 0, v6);
  payloadStaticOthers = self->_payloadStaticOthers;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v19[3] = &unk_24C638A90;
  v9 = v4;
  v20 = v9;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("static-others"), payloadStaticOthers, v19, 0, 0);
  payloadStaticApps = self->_payloadStaticApps;
  v14 = v8;
  v15 = 3221225472;
  v16 = __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v17 = &unk_24C638A90;
  v18 = v9;
  v11 = v9;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("static-apps"), payloadStaticApps, &v14, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("contents-immutable"), self->_payloadContentsImmutable, 0, v6, v14, v15, v16, v17);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("windowtabbing-immutable"), self->_payloadWindowtabbingImmutable, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("dblclickbehavior-immutable"), self->_payloadDblclickbehaviorImmutable, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("showindicators-immutable"), self->_payloadShowindicatorsImmutable, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("show-recents"), self->_payloadShowRecents, 0, v6);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

id __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)CEMDeviceDockDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v60, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadOrientation, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadPositionImmutable, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAutohide, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAutohideImmutable, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadMinimizeToApplication, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadMinimizeToApplicationImmutable, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadMagnification, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadMagnifyImmutable, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadLargesize, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadMagsizeImmutable, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadShowProcessIndicators, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadLaunchanim, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadLaunchanimImmutable, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSString copy](self->_payloadMineffect, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSNumber copy](self->_payloadMineffectImmutable, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSNumber copy](self->_payloadTilesize, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadSizeImmutable, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  v39 = -[NSArray copy](self->_payloadMCXDockSpecialFolders, "copy");
  v40 = (void *)v4[26];
  v4[26] = v39;

  v41 = -[NSNumber copy](self->_payloadAllowDockFixupOverride, "copy");
  v42 = (void *)v4[27];
  v4[27] = v41;

  v43 = -[NSNumber copy](self->_payloadStaticOnly, "copy");
  v44 = (void *)v4[28];
  v4[28] = v43;

  v45 = -[NSArray copy](self->_payloadStaticOthers, "copy");
  v46 = (void *)v4[29];
  v4[29] = v45;

  v47 = -[NSArray copy](self->_payloadStaticApps, "copy");
  v48 = (void *)v4[30];
  v4[30] = v47;

  v49 = -[NSNumber copy](self->_payloadContentsImmutable, "copy");
  v50 = (void *)v4[31];
  v4[31] = v49;

  v51 = -[NSNumber copy](self->_payloadWindowtabbingImmutable, "copy");
  v52 = (void *)v4[32];
  v4[32] = v51;

  v53 = -[NSNumber copy](self->_payloadDblclickbehaviorImmutable, "copy");
  v54 = (void *)v4[33];
  v4[33] = v53;

  v55 = -[NSNumber copy](self->_payloadShowindicatorsImmutable, "copy");
  v56 = (void *)v4[34];
  v4[34] = v55;

  v57 = -[NSNumber copy](self->_payloadShowRecents, "copy");
  v58 = (void *)v4[35];
  v4[35] = v57;

  return v4;
}

- (NSString)payloadOrientation
{
  return self->_payloadOrientation;
}

- (void)setPayloadOrientation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadPositionImmutable
{
  return self->_payloadPositionImmutable;
}

- (void)setPayloadPositionImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAutohide
{
  return self->_payloadAutohide;
}

- (void)setPayloadAutohide:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAutohideImmutable
{
  return self->_payloadAutohideImmutable;
}

- (void)setPayloadAutohideImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadMinimizeToApplication
{
  return self->_payloadMinimizeToApplication;
}

- (void)setPayloadMinimizeToApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadMinimizeToApplicationImmutable
{
  return self->_payloadMinimizeToApplicationImmutable;
}

- (void)setPayloadMinimizeToApplicationImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadMagnification
{
  return self->_payloadMagnification;
}

- (void)setPayloadMagnification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadMagnifyImmutable
{
  return self->_payloadMagnifyImmutable;
}

- (void)setPayloadMagnifyImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadLargesize
{
  return self->_payloadLargesize;
}

- (void)setPayloadLargesize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadMagsizeImmutable
{
  return self->_payloadMagsizeImmutable;
}

- (void)setPayloadMagsizeImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadShowProcessIndicators
{
  return self->_payloadShowProcessIndicators;
}

- (void)setPayloadShowProcessIndicators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadLaunchanim
{
  return self->_payloadLaunchanim;
}

- (void)setPayloadLaunchanim:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadLaunchanimImmutable
{
  return self->_payloadLaunchanimImmutable;
}

- (void)setPayloadLaunchanimImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)payloadMineffect
{
  return self->_payloadMineffect;
}

- (void)setPayloadMineffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadMineffectImmutable
{
  return self->_payloadMineffectImmutable;
}

- (void)setPayloadMineffectImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadTilesize
{
  return self->_payloadTilesize;
}

- (void)setPayloadTilesize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadSizeImmutable
{
  return self->_payloadSizeImmutable;
}

- (void)setPayloadSizeImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)payloadMCXDockSpecialFolders
{
  return self->_payloadMCXDockSpecialFolders;
}

- (void)setPayloadMCXDockSpecialFolders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)payloadAllowDockFixupOverride
{
  return self->_payloadAllowDockFixupOverride;
}

- (void)setPayloadAllowDockFixupOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)payloadStaticOnly
{
  return self->_payloadStaticOnly;
}

- (void)setPayloadStaticOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)payloadStaticOthers
{
  return self->_payloadStaticOthers;
}

- (void)setPayloadStaticOthers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)payloadStaticApps
{
  return self->_payloadStaticApps;
}

- (void)setPayloadStaticApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)payloadContentsImmutable
{
  return self->_payloadContentsImmutable;
}

- (void)setPayloadContentsImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)payloadWindowtabbingImmutable
{
  return self->_payloadWindowtabbingImmutable;
}

- (void)setPayloadWindowtabbingImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)payloadDblclickbehaviorImmutable
{
  return self->_payloadDblclickbehaviorImmutable;
}

- (void)setPayloadDblclickbehaviorImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)payloadShowindicatorsImmutable
{
  return self->_payloadShowindicatorsImmutable;
}

- (void)setPayloadShowindicatorsImmutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)payloadShowRecents
{
  return self->_payloadShowRecents;
}

- (void)setPayloadShowRecents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadShowRecents, 0);
  objc_storeStrong((id *)&self->_payloadShowindicatorsImmutable, 0);
  objc_storeStrong((id *)&self->_payloadDblclickbehaviorImmutable, 0);
  objc_storeStrong((id *)&self->_payloadWindowtabbingImmutable, 0);
  objc_storeStrong((id *)&self->_payloadContentsImmutable, 0);
  objc_storeStrong((id *)&self->_payloadStaticApps, 0);
  objc_storeStrong((id *)&self->_payloadStaticOthers, 0);
  objc_storeStrong((id *)&self->_payloadStaticOnly, 0);
  objc_storeStrong((id *)&self->_payloadAllowDockFixupOverride, 0);
  objc_storeStrong((id *)&self->_payloadMCXDockSpecialFolders, 0);
  objc_storeStrong((id *)&self->_payloadSizeImmutable, 0);
  objc_storeStrong((id *)&self->_payloadTilesize, 0);
  objc_storeStrong((id *)&self->_payloadMineffectImmutable, 0);
  objc_storeStrong((id *)&self->_payloadMineffect, 0);
  objc_storeStrong((id *)&self->_payloadLaunchanimImmutable, 0);
  objc_storeStrong((id *)&self->_payloadLaunchanim, 0);
  objc_storeStrong((id *)&self->_payloadShowProcessIndicators, 0);
  objc_storeStrong((id *)&self->_payloadMagsizeImmutable, 0);
  objc_storeStrong((id *)&self->_payloadLargesize, 0);
  objc_storeStrong((id *)&self->_payloadMagnifyImmutable, 0);
  objc_storeStrong((id *)&self->_payloadMagnification, 0);
  objc_storeStrong((id *)&self->_payloadMinimizeToApplicationImmutable, 0);
  objc_storeStrong((id *)&self->_payloadMinimizeToApplication, 0);
  objc_storeStrong((id *)&self->_payloadAutohideImmutable, 0);
  objc_storeStrong((id *)&self->_payloadAutohide, 0);
  objc_storeStrong((id *)&self->_payloadPositionImmutable, 0);
  objc_storeStrong((id *)&self->_payloadOrientation, 0);
}

uint64_t __74__CEMDeviceDockDeclaration_StaticItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__CEMDeviceDockDeclaration_StaticItemTileData_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

@end
