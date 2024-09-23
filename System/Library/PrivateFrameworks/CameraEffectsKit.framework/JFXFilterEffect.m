@implementation JFXFilterEffect

- (int)type
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return -[JFXEffect copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (id)filterContentDataSource
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[JFXEffect contentDataSource](self, "contentDataSource"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2558EA090),
        v4,
        v5))
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contentProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  objc_super v16;

  -[JFXFilterEffect filterContentDataSource](self, "filterContentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15.receiver = self;
    v15.super_class = (Class)JFXFilterEffect;
    -[JFXEffect contentProperties](&v15, sel_contentProperties);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "isExpensive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "isExpensive");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("isExpensive"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isStyleTransfer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("isStyleTransfer"));

    objc_msgSend(v3, "proxyRenderScale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "proxyRenderScale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("proxyRenderScale"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "inverseToneMapOperator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE795C0]);

    if (v5)
    {
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
      v13 = v5;

      v6 = v13;
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)JFXFilterEffect;
    -[JFXEffect contentProperties](&v16, sel_contentProperties);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXFilterEffect)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return -[JFXEffect initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXFilterEffect;
  -[JFXEffect encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return -[JFXEffect isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXFilterEffect;
  return -[JFXEffect hash](&v3, sel_hash);
}

- (BOOL)enablePresentationState:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXFilterEffect;
  return -[JFXEffect enablePresentationState:](&v4, sel_enablePresentationState_, 0);
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXFilterEffect;
  -[JFXEffect setForceRenderAtPosterFrame:](&v3, sel_setForceRenderAtPosterFrame_, 0);
}

- (id)renderEffect
{
  void *v3;
  void *v4;
  objc_super v6;

  if (renderEffect_onceTokenSlide != -1)
    dispatch_once(&renderEffect_onceTokenSlide, &__block_literal_global_9);
  v3 = (void *)renderEffect_s_bypassHDRVariantEffectNames;
  -[JFXEffect effectID](self, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v4);

  if ((_DWORD)v3)
    -[JFXEffect setHDR:](self, "setHDR:", 0);
  v6.receiver = self;
  v6.super_class = (Class)JFXFilterEffect;
  -[JFXEffect renderEffect](&v6, sel_renderEffect);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __31__JFXFilterEffect_renderEffect__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v2[0] = *MEMORY[0x24BE79290];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)renderEffect_s_bypassHDRVariantEffectNames;
  renderEffect_s_bypassHDRVariantEffectNames = v0;

}

@end
