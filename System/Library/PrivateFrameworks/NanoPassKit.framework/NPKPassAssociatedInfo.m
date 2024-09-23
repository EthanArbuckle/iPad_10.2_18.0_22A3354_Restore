@implementation NPKPassAssociatedInfo

- (NPKPassAssociatedInfo)initWithTransitProperties:(id)a3 appletState:(id)a4 balanceFields:(id)a5 commutePlanFields:(id)a6 tiles:(id)a7 rangingSuspensionReason:(unint64_t)a8 accessories:(id)a9 isHomeAccessRestricted:(BOOL)a10 precursorPassDescription:(id)a11 hasDeviceBoundCommutePlans:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NPKPassAssociatedInfo *v23;
  NPKPassAssociatedInfo *v24;
  uint64_t v25;
  NSArray *balanceFields;
  uint64_t v27;
  NSArray *commutePlanFields;
  uint64_t v29;
  NSArray *tiles;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a11;
  v35.receiver = self;
  v35.super_class = (Class)NPKPassAssociatedInfo;
  v23 = -[NPKPassAssociatedInfo init](&v35, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_transitProperties, a3);
    objc_storeStrong((id *)&v24->_transitAppletState, a4);
    v25 = objc_msgSend(v18, "copy");
    balanceFields = v24->_balanceFields;
    v24->_balanceFields = (NSArray *)v25;

    v27 = objc_msgSend(v19, "copy");
    commutePlanFields = v24->_commutePlanFields;
    v24->_commutePlanFields = (NSArray *)v27;

    v29 = objc_msgSend(v20, "copy");
    tiles = v24->_tiles;
    v24->_tiles = (NSArray *)v29;

    v24->_rangingSuspensionReason = a8;
    objc_storeStrong((id *)&v24->_precursorPassDescription, a11);
    objc_storeStrong((id *)&v24->_accessories, a9);
    v24->_isHomeAccessRestricted = a10;
    v24->_hasDeviceBoundCommutePlans = a12;
  }

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p> {transitProperties:%@, appletState:%@, balanceFields:%@ commutePlanFields:%@, tiles:%@, rangingSuspensionReason:%lu, precursorPassDescription:%@, hasDeviceBoundCommutePlans:%lu"), objc_opt_class(), self, self->_transitProperties, self->_transitAppletState, self->_balanceFields, self->_commutePlanFields, self->_tiles, self->_rangingSuspensionReason, self->_precursorPassDescription, self->_hasDeviceBoundCommutePlans);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(", accessories:%@"), self->_accessories);
  return v4;
}

- (PKTransitPassProperties)transitProperties
{
  return self->_transitProperties;
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (NSArray)balanceFields
{
  return self->_balanceFields;
}

- (NSArray)commutePlanFields
{
  return self->_commutePlanFields;
}

- (NSArray)tiles
{
  return self->_tiles;
}

- (unint64_t)rangingSuspensionReason
{
  return self->_rangingSuspensionReason;
}

- (BOOL)hasDeviceBoundCommutePlans
{
  return self->_hasDeviceBoundCommutePlans;
}

- (NPKBankConnectAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (PKPrecursorPassUpgradeRequestDescription)precursorPassDescription
{
  return self->_precursorPassDescription;
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (BOOL)isHomeAccessRestricted
{
  return self->_isHomeAccessRestricted;
}

- (void)setIsHomeAccessRestricted:(BOOL)a3
{
  self->_isHomeAccessRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_precursorPassDescription, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_commutePlanFields, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_transitAppletState, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
}

@end
