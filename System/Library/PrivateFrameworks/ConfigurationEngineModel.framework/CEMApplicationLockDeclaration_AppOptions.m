@implementation CEMApplicationLockDeclaration_AppOptions

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DisableTouch");
  v6[1] = CFSTR("DisableDeviceRotation");
  v6[2] = CFSTR("DisableVolumeButtons");
  v6[3] = CFSTR("DisableRingerSwitch");
  v6[4] = CFSTR("DisableSleepWakeButton");
  v6[5] = CFSTR("DisableAutoLock");
  v6[6] = CFSTR("EnableVoiceOver");
  v6[7] = CFSTR("EnableZoom");
  v6[8] = CFSTR("EnableInvertColors");
  v6[9] = CFSTR("EnableAssistiveTouch");
  v6[10] = CFSTR("EnableSpeakSelection");
  v6[11] = CFSTR("EnableMonoAudio");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDisableTouch:(id)a3 withDisableDeviceRotation:(id)a4 withDisableVolumeButtons:(id)a5 withDisableRingerSwitch:(id)a6 withDisableSleepWakeButton:(id)a7 withDisableAutoLock:(id)a8 withEnableVoiceOver:(id)a9 withEnableZoom:(id)a10 withEnableInvertColors:(id)a11 withEnableAssistiveTouch:(id)a12 withEnableSpeakSelection:(id)a13 withEnableMonoAudio:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
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
  id v44;
  id v45;
  id v46;
  id v47;

  v47 = a14;
  v46 = a13;
  v45 = a12;
  v44 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  v27 = v26;
  v28 = (void *)MEMORY[0x24BDBD1C0];
  if (v25)
    v29 = v25;
  else
    v29 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v26, "setPayloadDisableTouch:", v29, a4);

  if (v24)
    v30 = v24;
  else
    v30 = v28;
  objc_msgSend(v27, "setPayloadDisableDeviceRotation:", v30);

  if (v23)
    v31 = v23;
  else
    v31 = v28;
  objc_msgSend(v27, "setPayloadDisableVolumeButtons:", v31);

  if (v22)
    v32 = v22;
  else
    v32 = v28;
  objc_msgSend(v27, "setPayloadDisableRingerSwitch:", v32);

  if (v21)
    v33 = v21;
  else
    v33 = v28;
  objc_msgSend(v27, "setPayloadDisableSleepWakeButton:", v33);

  if (v20)
    v34 = v20;
  else
    v34 = v28;
  objc_msgSend(v27, "setPayloadDisableAutoLock:", v34);

  if (v19)
    v35 = v19;
  else
    v35 = v28;
  objc_msgSend(v27, "setPayloadEnableVoiceOver:", v35);

  if (v18)
    v36 = v18;
  else
    v36 = v28;
  objc_msgSend(v27, "setPayloadEnableZoom:", v36);

  if (v44)
    v37 = v44;
  else
    v37 = v28;
  objc_msgSend(v27, "setPayloadEnableInvertColors:", v37);

  if (v45)
    v38 = v45;
  else
    v38 = v28;
  objc_msgSend(v27, "setPayloadEnableAssistiveTouch:", v38);

  if (v46)
    v39 = v46;
  else
    v39 = v28;
  objc_msgSend(v27, "setPayloadEnableSpeakSelection:", v39);

  if (v47)
    v40 = v47;
  else
    v40 = v28;
  objc_msgSend(v27, "setPayloadEnableMonoAudio:", v40);

  return v27;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
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
  NSNumber *payloadDisableTouch;
  NSNumber *v16;
  NSNumber *payloadDisableDeviceRotation;
  NSNumber *v18;
  NSNumber *payloadDisableVolumeButtons;
  NSNumber *v20;
  NSNumber *payloadDisableRingerSwitch;
  NSNumber *v22;
  NSNumber *payloadDisableSleepWakeButton;
  NSNumber *v24;
  NSNumber *payloadDisableAutoLock;
  NSNumber *v26;
  NSNumber *payloadEnableVoiceOver;
  NSNumber *v28;
  NSNumber *payloadEnableZoom;
  NSNumber *v30;
  NSNumber *payloadEnableInvertColors;
  NSNumber *v32;
  NSNumber *payloadEnableAssistiveTouch;
  NSNumber *v34;
  NSNumber *payloadEnableSpeakSelection;
  NSNumber *v36;
  NSNumber *payloadEnableMonoAudio;
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

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationLockDeclaration_AppOptions allowedPayloadKeys](CEMApplicationLockDeclaration_AppOptions, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v50 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableTouch"), 0, MEMORY[0x24BDBD1C0], &v50);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v50;
  payloadDisableTouch = self->_payloadDisableTouch;
  self->_payloadDisableTouch = v13;

  if (!v14)
  {
    v49 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableDeviceRotation"), 0, MEMORY[0x24BDBD1C0], &v49);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v49;
    payloadDisableDeviceRotation = self->_payloadDisableDeviceRotation;
    self->_payloadDisableDeviceRotation = v16;

    if (!v14)
    {
      v48 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableVolumeButtons"), 0, MEMORY[0x24BDBD1C0], &v48);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v48;
      payloadDisableVolumeButtons = self->_payloadDisableVolumeButtons;
      self->_payloadDisableVolumeButtons = v18;

      if (!v14)
      {
        v47 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableRingerSwitch"), 0, MEMORY[0x24BDBD1C0], &v47);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v47;
        payloadDisableRingerSwitch = self->_payloadDisableRingerSwitch;
        self->_payloadDisableRingerSwitch = v20;

        if (!v14)
        {
          v46 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableSleepWakeButton"), 0, MEMORY[0x24BDBD1C0], &v46);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v46;
          payloadDisableSleepWakeButton = self->_payloadDisableSleepWakeButton;
          self->_payloadDisableSleepWakeButton = v22;

          if (!v14)
          {
            v45 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableAutoLock"), 0, MEMORY[0x24BDBD1C0], &v45);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v45;
            payloadDisableAutoLock = self->_payloadDisableAutoLock;
            self->_payloadDisableAutoLock = v24;

            if (!v14)
            {
              v44 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableVoiceOver"), 0, MEMORY[0x24BDBD1C0], &v44);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v44;
              payloadEnableVoiceOver = self->_payloadEnableVoiceOver;
              self->_payloadEnableVoiceOver = v26;

              if (!v14)
              {
                v43 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableZoom"), 0, MEMORY[0x24BDBD1C0], &v43);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v43;
                payloadEnableZoom = self->_payloadEnableZoom;
                self->_payloadEnableZoom = v28;

                if (!v14)
                {
                  v42 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableInvertColors"), 0, MEMORY[0x24BDBD1C0], &v42);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v42;
                  payloadEnableInvertColors = self->_payloadEnableInvertColors;
                  self->_payloadEnableInvertColors = v30;

                  if (!v14)
                  {
                    v41 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableAssistiveTouch"), 0, MEMORY[0x24BDBD1C0], &v41);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v41;
                    payloadEnableAssistiveTouch = self->_payloadEnableAssistiveTouch;
                    self->_payloadEnableAssistiveTouch = v32;

                    if (!v14)
                    {
                      v40 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableSpeakSelection"), 0, MEMORY[0x24BDBD1C0], &v40);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v40;
                      payloadEnableSpeakSelection = self->_payloadEnableSpeakSelection;
                      self->_payloadEnableSpeakSelection = v34;

                      if (!v14)
                      {
                        v39 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableMonoAudio"), 0, MEMORY[0x24BDBD1C0], &v39);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v39;
                        payloadEnableMonoAudio = self->_payloadEnableMonoAudio;
                        self->_payloadEnableMonoAudio = v36;

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

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableTouch"), self->_payloadDisableTouch, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableDeviceRotation"), self->_payloadDisableDeviceRotation, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableVolumeButtons"), self->_payloadDisableVolumeButtons, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableRingerSwitch"), self->_payloadDisableRingerSwitch, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableSleepWakeButton"), self->_payloadDisableSleepWakeButton, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableAutoLock"), self->_payloadDisableAutoLock, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableVoiceOver"), self->_payloadEnableVoiceOver, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableZoom"), self->_payloadEnableZoom, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableInvertColors"), self->_payloadEnableInvertColors, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableAssistiveTouch"), self->_payloadEnableAssistiveTouch, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableSpeakSelection"), self->_payloadEnableSpeakSelection, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EnableMonoAudio"), self->_payloadEnableMonoAudio, 0, v5);
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CEMApplicationLockDeclaration_AppOptions;
  v4 = -[CEMPayloadBase copyWithZone:](&v30, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadDisableTouch, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadDisableDeviceRotation, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadDisableVolumeButtons, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadDisableRingerSwitch, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadDisableSleepWakeButton, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_payloadDisableAutoLock, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadEnableVoiceOver, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadEnableZoom, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadEnableInvertColors, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadEnableAssistiveTouch, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_payloadEnableSpeakSelection, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSNumber copy](self->_payloadEnableMonoAudio, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  return v4;
}

- (NSNumber)payloadDisableTouch
{
  return self->_payloadDisableTouch;
}

- (void)setPayloadDisableTouch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadDisableDeviceRotation
{
  return self->_payloadDisableDeviceRotation;
}

- (void)setPayloadDisableDeviceRotation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadDisableVolumeButtons
{
  return self->_payloadDisableVolumeButtons;
}

- (void)setPayloadDisableVolumeButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadDisableRingerSwitch
{
  return self->_payloadDisableRingerSwitch;
}

- (void)setPayloadDisableRingerSwitch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadDisableSleepWakeButton
{
  return self->_payloadDisableSleepWakeButton;
}

- (void)setPayloadDisableSleepWakeButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadDisableAutoLock
{
  return self->_payloadDisableAutoLock;
}

- (void)setPayloadDisableAutoLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadEnableVoiceOver
{
  return self->_payloadEnableVoiceOver;
}

- (void)setPayloadEnableVoiceOver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadEnableZoom
{
  return self->_payloadEnableZoom;
}

- (void)setPayloadEnableZoom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadEnableInvertColors
{
  return self->_payloadEnableInvertColors;
}

- (void)setPayloadEnableInvertColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadEnableAssistiveTouch
{
  return self->_payloadEnableAssistiveTouch;
}

- (void)setPayloadEnableAssistiveTouch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadEnableSpeakSelection
{
  return self->_payloadEnableSpeakSelection;
}

- (void)setPayloadEnableSpeakSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadEnableMonoAudio
{
  return self->_payloadEnableMonoAudio;
}

- (void)setPayloadEnableMonoAudio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEnableMonoAudio, 0);
  objc_storeStrong((id *)&self->_payloadEnableSpeakSelection, 0);
  objc_storeStrong((id *)&self->_payloadEnableAssistiveTouch, 0);
  objc_storeStrong((id *)&self->_payloadEnableInvertColors, 0);
  objc_storeStrong((id *)&self->_payloadEnableZoom, 0);
  objc_storeStrong((id *)&self->_payloadEnableVoiceOver, 0);
  objc_storeStrong((id *)&self->_payloadDisableAutoLock, 0);
  objc_storeStrong((id *)&self->_payloadDisableSleepWakeButton, 0);
  objc_storeStrong((id *)&self->_payloadDisableRingerSwitch, 0);
  objc_storeStrong((id *)&self->_payloadDisableVolumeButtons, 0);
  objc_storeStrong((id *)&self->_payloadDisableDeviceRotation, 0);
  objc_storeStrong((id *)&self->_payloadDisableTouch, 0);
}

@end
