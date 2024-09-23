@implementation HUServiceDetailsRemoveItem

- (id)_subclass_updateWithOptions:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (-[HUServiceDetailsAbstractItem isCamera](self, "isCamera", a3))
  {
    v4 = CFSTR("HUServiceDetailsRemoveCameraName");
  }
  else if (-[HUServiceDetailsAbstractItem isItemGroup](self, "isItemGroup"))
  {
    v4 = CFSTR("HUServiceDetailsRemoveServiceGroupName");
  }
  else if (-[HUServiceDetailsAbstractItem isVisibleAsBridge](self, "isVisibleAsBridge"))
  {
    v4 = CFSTR("HUServiceDetailsRemoveBridgeName");
  }
  else
  {
    v4 = CFSTR("HUServiceDetailsRemoveDeviceName");
  }
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30BA0];
  v16[0] = *MEMORY[0x1E0D30D18];
  v16[1] = v6;
  v17[0] = v5;
  v17[1] = CFSTR("AccessoryDetails.RemoveAccessory");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = -[HUServiceDetailsAbstractItem canShowAsIndividualTiles](self, "canShowAsIndividualTiles");
  v10 = (_QWORD *)MEMORY[0x1E0D30D70];
  if (v9)
  {
    v11 = -[HUServiceDetailsAbstractItem isSensorService](self, "isSensorService");
    if (-[HUServiceDetailsAbstractItem isContainedInAParent](self, "isContainedInAParent") && !v11)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v10);
  }
  else
  {
    -[HUServiceDetailsAbstractItem isContainedInAParent](self, "isContainedInAParent");
  }
  if (-[HUServiceDetailsAbstractItem isBridged](self, "isBridged"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v10);
  if (-[HUServiceDetailsAbstractItem isNetworkRouterSatellite](self, "isNetworkRouterSatellite"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v10);
  v12 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
