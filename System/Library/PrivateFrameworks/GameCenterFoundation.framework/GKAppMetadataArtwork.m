@implementation GKAppMetadataArtwork

- (GKAppMetadataArtwork)initWithTemplateURL:(id)a3 width:(id)a4 height:(id)a5 textColor1:(id)a6 textColor2:(id)a7 textColor3:(id)a8 textColor4:(id)a9 backgroundColor:(id)a10
{
  id v17;
  GKAppMetadataArtwork *v18;
  GKAppMetadataArtwork *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)GKAppMetadataArtwork;
  v18 = -[GKAppMetadataArtwork init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_templateURL, a3);
    objc_storeStrong((id *)&v19->_width, a4);
    objc_storeStrong((id *)&v19->_height, a5);
    objc_storeStrong((id *)&v19->_textColor1, a6);
    objc_storeStrong((id *)&v19->_textColor2, a7);
    objc_storeStrong((id *)&v19->_textColor3, a8);
    objc_storeStrong((id *)&v19->_textColor4, a9);
    objc_storeStrong((id *)&v19->_backgroundColor, a10);
  }

  return v19;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_18 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_18, &__block_literal_global_59);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_18;
}

void __47__GKAppMetadataArtwork_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("templateURL");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("textColor1");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("textColor2");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("textColor3");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("textColor4");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("backgroundColor");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("width");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("height");
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_18;
  secureCodedPropertyKeys_sSecureCodedKeys_18 = v0;

}

- (NSString)templateURL
{
  return self->_templateURL;
}

- (NSNumber)width
{
  return self->_width;
}

- (NSNumber)height
{
  return self->_height;
}

- (NSString)textColor1
{
  return self->_textColor1;
}

- (NSString)textColor2
{
  return self->_textColor2;
}

- (NSString)textColor3
{
  return self->_textColor3;
}

- (NSString)textColor4
{
  return self->_textColor4;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor4, 0);
  objc_storeStrong((id *)&self->_textColor3, 0);
  objc_storeStrong((id *)&self->_textColor2, 0);
  objc_storeStrong((id *)&self->_textColor1, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
}

@end
