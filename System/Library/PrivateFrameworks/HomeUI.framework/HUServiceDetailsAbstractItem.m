@implementation HUServiceDetailsAbstractItem

- (HUServiceDetailsAbstractItem)initWithSourceServiceItem:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUServiceDetailsAbstractItem *v8;
  HUServiceDetailsAbstractItem *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUServiceDetailsAbstractItem;
  v8 = -[HUServiceDetailsAbstractItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HUServiceDetailsAbstractItem setSourceServiceItem:](v8, "setSourceServiceItem:", v6);
    -[HUServiceDetailsAbstractItem setHome:](v9, "setHome:", v7);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSourceServiceItem:home:", v5, v6);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsAbstractItem.m"), 40, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUServiceDetailsAbstractItem _subclass_updateWithOptions:]", objc_opt_class());

  return 0;
}

- (BOOL)isItemGroup
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2AC600))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "isItemGroup");
  return v5;
}

- (BOOL)isContainedWithinItemGroup
{
  void *v2;
  void *v3;
  id v4;
  char v5;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2AC600))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "isContainedWithinItemGroup");
  return v5;
}

- (BOOL)isAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  char isKindOfClass;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:

LABEL_6:
    return 1;
  }
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_5;
  }
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) != 0
      || -[HUServiceDetailsAbstractItem isMediaAccessory](self, "isMediaAccessory")
      && !-[HUServiceDetailsAbstractItem isMediaAccessoryGroup](self, "isMediaAccessoryGroup");
}

- (id)sourceAccessory
{
  void *v2;
  void *v3;
  void *v4;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isMultiServiceAccessory
{
  void *v2;
  char v3;

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isMultiServiceAccessory");

  return v3;
}

- (BOOL)isService
{
  void *v2;
  char isKindOfClass;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isMediaAccessory
{
  void *v2;
  char isKindOfClass;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isMediaAccessoryGroup
{
  _BOOL4 v3;

  v3 = -[HUServiceDetailsAbstractItem isMediaAccessory](self, "isMediaAccessory");
  if (v3)
    LOBYTE(v3) = -[HUServiceDetailsAbstractItem isItemGroup](self, "isItemGroup");
  return v3;
}

- (BOOL)isCamera
{
  void *v2;
  char isKindOfClass;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isNotificationSupportedCamera
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_isNotificationSupportedCamera");

  return v8;
}

- (BOOL)isBridge
{
  void *v2;
  char v3;

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isBridge");

  return v3;
}

- (BOOL)isBridged
{
  void *v2;
  char v3;

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBridged");

  return v3;
}

- (BOOL)isVisibleAsBridge
{
  void *v2;
  char v3;

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isVisibleAsBridge");

  return v3;
}

- (BOOL)isAccessoryDisplayedAsIndividualTiles
{
  void *v2;
  char v3;

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_showAsIndividualServices");

  return v3;
}

- (BOOL)isContainedInAParent
{
  _BOOL4 v3;

  if (-[HUServiceDetailsAbstractItem isMediaAccessory](self, "isMediaAccessory"))
  {
    LOBYTE(v3) = -[HUServiceDetailsAbstractItem isContainedWithinItemGroup](self, "isContainedWithinItemGroup");
  }
  else
  {
    v3 = -[HUServiceDetailsAbstractItem isService](self, "isService");
    if (v3)
    {
      v3 = -[HUServiceDetailsAbstractItem isMultiServiceAccessory](self, "isMultiServiceAccessory");
      if (v3)
        LOBYTE(v3) = !-[HUServiceDetailsAbstractItem isAccessoryDisplayedAsIndividualTiles](self, "isAccessoryDisplayedAsIndividualTiles");
    }
  }
  return v3;
}

- (BOOL)isNetworkRouter
{
  void *v2;
  void *v3;
  char v4;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_204);

  return v4;
}

uint64_t __47__HUServiceDetailsAbstractItem_isNetworkRouter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

- (BOOL)isNetworkRouterSatellite
{
  void *v2;
  void *v3;
  char v4;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_65_1);

  return v4;
}

uint64_t __56__HUServiceDetailsAbstractItem_isNetworkRouterSatellite__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouterSatellite");
}

- (BOOL)isSensorService
{
  void *v2;
  char isKindOfClass;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)canShowAsIndividualTiles
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v6, "hf_canShowAsIndividualServices");
  }
  else
  {
    objc_opt_class();
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v7 = v8;

    if (v7)
    {
      objc_msgSend(v7, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v10, "hf_canShowAsIndividualServices");

    }
    else
    {
      v6 = 0;
    }
  }

  return (char)v7;
}

- (BOOL)isAudioAnalysisSupportedDevice
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D31530];
    objc_msgSend(v5, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isAudioAnalysisSupportedDevice:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCHIPAccessory
{
  void *v2;
  char v3;

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCHIP");

  return v3;
}

- (HFServiceLikeItem)sourceServiceItem
{
  return self->_sourceServiceItem;
}

- (void)setSourceServiceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceServiceItem, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_sourceServiceItem, 0);
}

@end
