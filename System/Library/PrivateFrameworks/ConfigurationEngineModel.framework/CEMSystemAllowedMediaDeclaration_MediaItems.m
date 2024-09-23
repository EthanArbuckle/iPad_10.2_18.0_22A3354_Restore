@implementation CEMSystemAllowedMediaDeclaration_MediaItems

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("all-media");
  v6[1] = CFSTR("cd");
  v6[2] = CFSTR("dvd");
  v6[3] = CFSTR("bd");
  v6[4] = CFSTR("blankcd");
  v6[5] = CFSTR("blankdvd");
  v6[6] = CFSTR("blankbd");
  v6[7] = CFSTR("dvdram");
  v6[8] = CFSTR("disk-image");
  v6[9] = CFSTR("harddisk-internal");
  v6[10] = CFSTR("harddisk-external");
  v6[11] = CFSTR("networkdisk");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithAllMedia:(id)a3 withCd:(id)a4 withDvd:(id)a5 withBd:(id)a6 withBlankcd:(id)a7 withBlankdvd:(id)a8 withBlankbd:(id)a9 withDvdram:(id)a10 withDiskImage:(id)a11 withHarddiskInternal:(id)a12 withHarddiskExternal:(id)a13 withNetworkdisk:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v31;
  id v32;
  id v33;

  v33 = a14;
  v19 = a13;
  v32 = a12;
  v31 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setPayloadAllMedia:", v27);

  objc_msgSend(v28, "setPayloadCd:", v26);
  objc_msgSend(v28, "setPayloadDvd:", v25);

  objc_msgSend(v28, "setPayloadBd:", v24);
  objc_msgSend(v28, "setPayloadBlankcd:", v23);

  objc_msgSend(v28, "setPayloadBlankdvd:", v22);
  objc_msgSend(v28, "setPayloadBlankbd:", v21);

  objc_msgSend(v28, "setPayloadDvdram:", v20);
  objc_msgSend(v28, "setPayloadDiskImage:", v31);

  objc_msgSend(v28, "setPayloadHarddiskInternal:", v32);
  objc_msgSend(v28, "setPayloadHarddiskExternal:", v19);

  objc_msgSend(v28, "setPayloadNetworkdisk:", v33);
  return v28;
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
  NSString *v13;
  id v14;
  NSString *payloadAllMedia;
  NSArray *v16;
  NSArray *payloadCd;
  NSArray *v18;
  NSArray *payloadDvd;
  NSArray *v20;
  NSArray *payloadBd;
  NSArray *v22;
  NSArray *payloadBlankcd;
  NSArray *v24;
  NSArray *payloadBlankdvd;
  NSArray *v26;
  NSArray *payloadBlankbd;
  NSArray *v28;
  NSArray *payloadDvdram;
  NSArray *v30;
  NSArray *payloadDiskImage;
  NSArray *v32;
  NSArray *payloadHarddiskInternal;
  NSArray *v34;
  NSArray *payloadHarddiskExternal;
  NSArray *v36;
  NSArray *payloadNetworkdisk;
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

  +[CEMSystemAllowedMediaDeclaration_MediaItems allowedPayloadKeys](CEMSystemAllowedMediaDeclaration_MediaItems, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v50 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("all-media"), 0, 0, &v50);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v50;
  payloadAllMedia = self->_payloadAllMedia;
  self->_payloadAllMedia = v13;

  if (!v14)
  {
    v49 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("cd"), &__block_literal_global_37, 0, 0, &v49);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v49;
    payloadCd = self->_payloadCd;
    self->_payloadCd = v16;

    if (!v14)
    {
      v48 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("dvd"), &__block_literal_global_128_1, 0, 0, &v48);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v48;
      payloadDvd = self->_payloadDvd;
      self->_payloadDvd = v18;

      if (!v14)
      {
        v47 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("bd"), &__block_literal_global_129_0, 0, 0, &v47);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v47;
        payloadBd = self->_payloadBd;
        self->_payloadBd = v20;

        if (!v14)
        {
          v46 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("blankcd"), &__block_literal_global_130, 0, 0, &v46);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v46;
          payloadBlankcd = self->_payloadBlankcd;
          self->_payloadBlankcd = v22;

          if (!v14)
          {
            v45 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("blankdvd"), &__block_literal_global_131_0, 0, 0, &v45);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v45;
            payloadBlankdvd = self->_payloadBlankdvd;
            self->_payloadBlankdvd = v24;

            if (!v14)
            {
              v44 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("blankbd"), &__block_literal_global_132, 0, 0, &v44);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v44;
              payloadBlankbd = self->_payloadBlankbd;
              self->_payloadBlankbd = v26;

              if (!v14)
              {
                v43 = 0;
                -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("dvdram"), &__block_literal_global_133, 0, 0, &v43);
                v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                v14 = v43;
                payloadDvdram = self->_payloadDvdram;
                self->_payloadDvdram = v28;

                if (!v14)
                {
                  v42 = 0;
                  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("disk-image"), &__block_literal_global_134, 0, 0, &v42);
                  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
                  v14 = v42;
                  payloadDiskImage = self->_payloadDiskImage;
                  self->_payloadDiskImage = v30;

                  if (!v14)
                  {
                    v41 = 0;
                    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("harddisk-internal"), &__block_literal_global_135, 0, 0, &v41);
                    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
                    v14 = v41;
                    payloadHarddiskInternal = self->_payloadHarddiskInternal;
                    self->_payloadHarddiskInternal = v32;

                    if (!v14)
                    {
                      v40 = 0;
                      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("harddisk-external"), &__block_literal_global_136, 0, 0, &v40);
                      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
                      v14 = v40;
                      payloadHarddiskExternal = self->_payloadHarddiskExternal;
                      self->_payloadHarddiskExternal = v34;

                      if (!v14)
                      {
                        v39 = 0;
                        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("networkdisk"), &__block_literal_global_137, 0, 0, &v39);
                        v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
                        v14 = v39;
                        payloadNetworkdisk = self->_payloadNetworkdisk;
                        self->_payloadNetworkdisk = v36;

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
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("all-media"), self->_payloadAllMedia, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("cd"), self->_payloadCd, &__block_literal_global_139, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("dvd"), self->_payloadDvd, &__block_literal_global_140, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("bd"), self->_payloadBd, &__block_literal_global_141, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("blankcd"), self->_payloadBlankcd, &__block_literal_global_142, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("blankdvd"), self->_payloadBlankdvd, &__block_literal_global_143, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("blankbd"), self->_payloadBlankbd, &__block_literal_global_144, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("dvdram"), self->_payloadDvdram, &__block_literal_global_145, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("disk-image"), self->_payloadDiskImage, &__block_literal_global_146, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("harddisk-internal"), self->_payloadHarddiskInternal, &__block_literal_global_147, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("harddisk-external"), self->_payloadHarddiskExternal, &__block_literal_global_148, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("networkdisk"), self->_payloadNetworkdisk, &__block_literal_global_149_0, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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
  v30.super_class = (Class)CEMSystemAllowedMediaDeclaration_MediaItems;
  v4 = -[CEMPayloadBase copyWithZone:](&v30, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadAllMedia, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadCd, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadDvd, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadBd, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadBlankcd, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadBlankdvd, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadBlankbd, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSArray copy](self->_payloadDvdram, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSArray copy](self->_payloadDiskImage, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSArray copy](self->_payloadHarddiskInternal, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSArray copy](self->_payloadHarddiskExternal, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSArray copy](self->_payloadNetworkdisk, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  return v4;
}

- (NSString)payloadAllMedia
{
  return self->_payloadAllMedia;
}

- (void)setPayloadAllMedia:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadCd
{
  return self->_payloadCd;
}

- (void)setPayloadCd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadDvd
{
  return self->_payloadDvd;
}

- (void)setPayloadDvd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadBd
{
  return self->_payloadBd;
}

- (void)setPayloadBd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadBlankcd
{
  return self->_payloadBlankcd;
}

- (void)setPayloadBlankcd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadBlankdvd
{
  return self->_payloadBlankdvd;
}

- (void)setPayloadBlankdvd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadBlankbd
{
  return self->_payloadBlankbd;
}

- (void)setPayloadBlankbd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)payloadDvdram
{
  return self->_payloadDvdram;
}

- (void)setPayloadDvdram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadDiskImage
{
  return self->_payloadDiskImage;
}

- (void)setPayloadDiskImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)payloadHarddiskInternal
{
  return self->_payloadHarddiskInternal;
}

- (void)setPayloadHarddiskInternal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadHarddiskExternal
{
  return self->_payloadHarddiskExternal;
}

- (void)setPayloadHarddiskExternal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)payloadNetworkdisk
{
  return self->_payloadNetworkdisk;
}

- (void)setPayloadNetworkdisk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNetworkdisk, 0);
  objc_storeStrong((id *)&self->_payloadHarddiskExternal, 0);
  objc_storeStrong((id *)&self->_payloadHarddiskInternal, 0);
  objc_storeStrong((id *)&self->_payloadDiskImage, 0);
  objc_storeStrong((id *)&self->_payloadDvdram, 0);
  objc_storeStrong((id *)&self->_payloadBlankbd, 0);
  objc_storeStrong((id *)&self->_payloadBlankdvd, 0);
  objc_storeStrong((id *)&self->_payloadBlankcd, 0);
  objc_storeStrong((id *)&self->_payloadBd, 0);
  objc_storeStrong((id *)&self->_payloadDvd, 0);
  objc_storeStrong((id *)&self->_payloadCd, 0);
  objc_storeStrong((id *)&self->_payloadAllMedia, 0);
}

@end
