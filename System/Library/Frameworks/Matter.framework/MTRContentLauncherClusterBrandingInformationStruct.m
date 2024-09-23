@implementation MTRContentLauncherClusterBrandingInformationStruct

- (MTRContentLauncherClusterBrandingInformationStruct)init
{
  MTRContentLauncherClusterBrandingInformationStruct *v2;
  MTRContentLauncherClusterBrandingInformationStruct *v3;
  NSString *providerName;
  MTRContentLauncherClusterStyleInformationStruct *background;
  MTRContentLauncherClusterStyleInformationStruct *logo;
  MTRContentLauncherClusterStyleInformationStruct *progressBar;
  MTRContentLauncherClusterStyleInformationStruct *splash;
  MTRContentLauncherClusterStyleInformationStruct *waterMark;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRContentLauncherClusterBrandingInformationStruct;
  v2 = -[MTRContentLauncherClusterBrandingInformationStruct init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    providerName = v2->_providerName;
    v2->_providerName = (NSString *)&stru_2505249E8;

    background = v3->_background;
    v3->_background = 0;

    logo = v3->_logo;
    v3->_logo = 0;

    progressBar = v3->_progressBar;
    v3->_progressBar = 0;

    splash = v3->_splash;
    v3->_splash = 0;

    waterMark = v3->_waterMark;
    v3->_waterMark = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterBrandingInformationStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRContentLauncherClusterBrandingInformationStruct);
  objc_msgSend_providerName(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProviderName_(v4, v8, (uint64_t)v7);

  objc_msgSend_background(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackground_(v4, v12, (uint64_t)v11);

  objc_msgSend_logo(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLogo_(v4, v16, (uint64_t)v15);

  objc_msgSend_progressBar(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgressBar_(v4, v20, (uint64_t)v19);

  objc_msgSend_splash(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSplash_(v4, v24, (uint64_t)v23);

  objc_msgSend_waterMark(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWaterMark_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: providerName:%@; background:%@; logo:%@; progressBar:%@; splash:%@; waterMark:%@; >"),
    v5,
    self->_providerName,
    self->_background,
    self->_logo,
    self->_progressBar,
    self->_splash,
    self->_waterMark);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(NSString *)providerName
{
  objc_setProperty_nonatomic_copy(self, a2, providerName, 8);
}

- (MTRContentLauncherClusterStyleInformationStruct)background
{
  return self->_background;
}

- (void)setBackground:(MTRContentLauncherClusterStyleInformationStruct *)background
{
  objc_setProperty_nonatomic_copy(self, a2, background, 16);
}

- (MTRContentLauncherClusterStyleInformationStruct)logo
{
  return self->_logo;
}

- (void)setLogo:(MTRContentLauncherClusterStyleInformationStruct *)logo
{
  objc_setProperty_nonatomic_copy(self, a2, logo, 24);
}

- (MTRContentLauncherClusterStyleInformationStruct)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(MTRContentLauncherClusterStyleInformationStruct *)progressBar
{
  objc_setProperty_nonatomic_copy(self, a2, progressBar, 32);
}

- (MTRContentLauncherClusterStyleInformationStruct)splash
{
  return self->_splash;
}

- (void)setSplash:(MTRContentLauncherClusterStyleInformationStruct *)splash
{
  objc_setProperty_nonatomic_copy(self, a2, splash, 40);
}

- (MTRContentLauncherClusterStyleInformationStruct)waterMark
{
  return self->_waterMark;
}

- (void)setWaterMark:(MTRContentLauncherClusterStyleInformationStruct *)waterMark
{
  objc_setProperty_nonatomic_copy(self, a2, waterMark, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waterMark, 0);
  objc_storeStrong((id *)&self->_splash, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
}

@end
