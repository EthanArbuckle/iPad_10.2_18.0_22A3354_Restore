@implementation NPKPassAssociatedInfoModel

+ (id)accountBalanceForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "feature") == 4)
  {
    objc_msgSend(v3, "appleBalanceDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentBalance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EC40]), "initWithIdentifier:forCurrencyAmount:", CFSTR("account-balance-identifier"), v5);
    }
    else
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        pk_General_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "accountIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appleBalanceDetails");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412546;
          v14 = v10;
          v15 = 2112;
          v16 = v11;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Account apple balance not available for account with identifier %@, account details: %@", (uint8_t *)&v13, 0x16u);

        }
      }
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NPKPassAssociatedInfoModel)initWithPass:(id)a3
{
  return -[NPKPassAssociatedInfoModel initWithPass:transitProperties:balances:commutePlanValueRequired:](self, "initWithPass:transitProperties:balances:commutePlanValueRequired:", a3, 0, 0, 0);
}

- (NPKPassAssociatedInfoModel)initWithPass:(id)a3 transitProperties:(id)a4 balances:(id)a5 commutePlanValueRequired:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  NPKPassAssociatedInfoModel *v14;
  NPKPassAssociatedInfoModel *v15;
  void *v16;
  uint64_t v17;
  PKTransitPassProperties *transitPassProperties;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKPassAssociatedInfoModel;
  v14 = -[NPKPassAssociatedInfoModel init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    v16 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE6EF50], "passPropertiesForPass:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "copy");
    transitPassProperties = v15->_transitPassProperties;
    v15->_transitPassProperties = (PKTransitPassProperties *)v17;

    if (!v12)
    objc_storeStrong((id *)&v15->_balances, a5);
    v15->_commutePlanValueRequired = a6;
    -[NPKPassAssociatedInfoModel updateItemFields](v15, "updateItemFields");
  }

  return v15;
}

- (NSArray)allPassItemsFields
{
  return -[NSArray arrayByAddingObjectsFromArray:](self->_balanceFields, "arrayByAddingObjectsFromArray:", self->_commutePlanFields);
}

- (void)setTransitPassProperties:(id)a3
{
  PKTransitPassProperties *v4;
  PKTransitPassProperties *transitPassProperties;

  if (self->_transitPassProperties != a3)
  {
    v4 = (PKTransitPassProperties *)objc_msgSend(a3, "copy");
    transitPassProperties = self->_transitPassProperties;
    self->_transitPassProperties = v4;

    -[NPKPassAssociatedInfoModel updateItemFields](self, "updateItemFields");
  }
}

- (void)setBalances:(id)a3
{
  NSSet *v4;
  NSSet *balances;

  if (self->_balances != a3)
  {
    v4 = (NSSet *)objc_msgSend(a3, "copy");
    balances = self->_balances;
    self->_balances = v4;

    -[NPKPassAssociatedInfoModel updateItemFields](self, "updateItemFields");
  }
}

- (void)setDynamicPlans:(id)a3
{
  NSArray *v4;
  NSArray *dynamicPlans;

  if (self->_dynamicPlans != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    dynamicPlans = self->_dynamicPlans;
    self->_dynamicPlans = v4;

    -[NPKPassAssociatedInfoModel updateItemFields](self, "updateItemFields");
  }
}

- (void)setCommutePlanValueRequired:(BOOL)a3
{
  if (self->_commutePlanValueRequired != a3)
  {
    self->_commutePlanValueRequired = a3;
    -[NPKPassAssociatedInfoModel updateItemFields](self, "updateItemFields");
  }
}

- (void)setTiles:(id)a3
{
  NSArray *v4;
  NSArray *tiles;

  if (self->_tiles != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    tiles = self->_tiles;
    self->_tiles = v4;

  }
}

- (BOOL)isEqual:(id)a3
{
  NPKPassAssociatedInfoModel *v4;
  NPKPassAssociatedInfoModel *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (NPKPassAssociatedInfoModel *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPass uniqueID](v5->_pass, "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (NPKIsEqual(v6, v7)
        && NPKIsEqual(self->_balanceFields, v5->_balanceFields)
        && NPKIsEqual(self->_balances, v5->_balances)
        && NPKIsEqual(self->_transitPassProperties, v5->_transitPassProperties)
        && NPKIsEqual(self->_transitAppletState, v5->_transitAppletState)
        && NPKIsEqual(self->_tiles, v5->_tiles)
        && NPKIsEqual(self->_dynamicPlans, v5->_dynamicPlans)
        && self->_rangingSuspensionReason == v5->_rangingSuspensionReason)
      {
        v8 = NPKIsEqual(self->_precursorPassDescription, v5->_precursorPassDescription);
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hasDeviceBoundCommutePlans
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NPKPassAssociatedInfoModel commutePlanFields](self, "commutePlanFields", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDeviceBound") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateItemFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *balanceFields;
  NSArray *v13;
  NSArray *v14;
  NSArray *commutePlanFields;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  -[NPKPassAssociatedInfoModel _balanceByIDWithBalances:](self, "_balanceByIDWithBalances:", self->_balances);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel _commutePlansByIDWithPlans:](self, "_commutePlansByIDWithPlans:", self->_dynamicPlans);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel _primaryDisplayableBalanceFieldWithBalancesByID:](self, "_primaryDisplayableBalanceFieldWithBalancesByID:", v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel _allPassBalanceFieldsWithBalancesByID:](self, "_allPassBalanceFieldsWithBalancesByID:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __46__NPKPassAssociatedInfoModel_updateItemFields__block_invoke;
    v19[3] = &unk_24CFEBEE0;
    v20 = v8;
    v21 = v7;
    v9 = v7;
    v10 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
    v11 = (NSArray *)objc_msgSend(v9, "copy");
    balanceFields = self->_balanceFields;
    self->_balanceFields = v11;

  }
  else
  {
    v13 = (NSArray *)objc_msgSend(v5, "copy");
    v10 = self->_balanceFields;
    self->_balanceFields = v13;
  }

  -[NPKPassAssociatedInfoModel _commutePlanFieldsWithBalancesByID:dynamicPlansByID:](self, "_commutePlanFieldsWithBalancesByID:dynamicPlansByID:", v18, v3);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  commutePlanFields = self->_commutePlanFields;
  self->_commutePlanFields = v14;

  v16 = (void *)MEMORY[0x24BE6EBD8];
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "npkClearTransitValuePendingStateIfNecessaryForPassWithID:withBalanceFields:commutePlanFields:", v17, self->_balanceFields, self->_commutePlanFields);

}

void __46__NPKPassAssociatedInfoModel_updateItemFields__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (id)_primaryDisplayableBalanceFieldWithBalancesByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (!-[PKPaymentPass isContentLoaded](self->_pass, "isContentLoaded")
    || !-[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("account-balance-identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NPKPassAssociatedInfoModel _balanceFieldBalance:fieldIdentifier:](self, "_balanceFieldBalance:fieldIdentifier:", v6, CFSTR("account-balance-item"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  -[NPKPassAssociatedInfoModel _balancePassFieldsFromPass:](self, "_balancePassFieldsFromPass:", self->_pass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel _balanceFieldsWithBalancesByID:passFields:maximumCount:](self, "_balanceFieldsWithBalancesByID:passFields:maximumCount:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    goto LABEL_8;
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (id)_allPassBalanceFieldsWithBalancesByID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentPass isContentLoaded](self->_pass, "isContentLoaded"))
  {
    -[NPKPassAssociatedInfoModel _balancePassFieldsFromPass:](self, "_balancePassFieldsFromPass:", self->_pass);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassAssociatedInfoModel _balanceFieldsWithBalancesByID:passFields:maximumCount:](self, "_balanceFieldsWithBalancesByID:passFields:maximumCount:", v4, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  return v5;
}

- (id)_balanceFieldBalance:(id)a3 fieldIdentifier:(id)a4
{
  id v5;
  id v6;
  NPKBalanceField *v7;
  void *v8;
  void *v9;
  NPKBalanceField *v10;

  v5 = a4;
  v6 = a3;
  v7 = [NPKBalanceField alloc];
  PKLocalizedLynxString(CFSTR("PASS_BALANCE_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NPKBalanceField initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:](v7, "initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:", v6, v8, v9, v5, 1, 0, 0);

  return v10;
}

- (id)_balanceFieldsWithBalancesByID:(id)a3 passFields:(id)a4 maximumCount:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PKPaymentPass *pass;
  void *v15;
  void *v16;
  void *v17;
  NPKBalanceField *v18;
  void *v19;
  void *v20;
  void *v21;
  NPKBalanceField *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  void *v44;
  NPKPassAssociatedInfoModel *v45;
  unint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE6F618];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE6F618]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v48 = v12 == 0;
  v45 = self;
  v46 = a5;
  v42 = v9;
  if (v12)
  {
    pass = self->_pass;
    objc_msgSend(v12, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:currentBalance:](pass, "npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:currentBalance:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKPassAssociatedInfoModel _actionWithIdentifier:type:](self, "_actionWithIdentifier:type:", 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [NPKBalanceField alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_HEADER_TRANSIT_BALANCE"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "formattedValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NPKBalanceField initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:](v18, "initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:", v13, v20, v21, v11, 1, v17, v16);

    self = v45;
    objc_msgSend(v10, "addObject:", v22);

    a5 = v46;
    v9 = v42;

  }
  if (objc_msgSend(v8, "count"))
  {
    v41 = v13;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = v9;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v55;
      v43 = v23;
      v44 = v10;
      v47 = *(_QWORD *)v55;
      while (2)
      {
        v27 = 0;
        v49 = v25;
        do
        {
          if (*(_QWORD *)v55 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v27);
          if (objc_msgSend(v28, "foreignReferenceType"))
          {
            objc_msgSend(v28, "foreignReferenceIdentifiers");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = v29;
              if (objc_msgSend(v29, "count") == 1)
              {
                objc_msgSend(v30, "anyObject");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v30, "count"));
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v33 = v30;
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                if (v34)
                {
                  v35 = v34;
                  v36 = *(_QWORD *)v51;
                  do
                  {
                    for (i = 0; i != v35; ++i)
                    {
                      if (*(_QWORD *)v51 != v36)
                        objc_enumerationMutation(v33);
                      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "npkSafelyAddObject:", v38);

                    }
                    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                  }
                  while (v35);
                }

                v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EC40]), "initWithComponentBalances:identifiers:", v31, v33);
                v10 = v44;
                self = v45;
                a5 = v46;
                v23 = v43;
              }

              if (v32)
              {
                -[NPKPassAssociatedInfoModel _balanceFieldWithPassField:balance:isPrimaryBalance:](self, "_balanceFieldWithPassField:balance:isPrimaryBalance:", v28, v32, v48);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39)
                {
                  objc_msgSend(v10, "addObject:", v39);
                  v48 = 0;
                }
                if (a5 && objc_msgSend(v10, "count") >= a5)
                {

                  goto LABEL_32;
                }

              }
              v26 = v47;
              v25 = v49;
            }
          }
          ++v27;
        }
        while (v27 != v25);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        if (v25)
          continue;
        break;
      }
    }
LABEL_32:

    v13 = v41;
    v9 = v42;
  }

  return v10;
}

- (id)_balanceByIDWithBalances:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__NPKPassAssociatedInfoModel__balanceByIDWithBalances___block_invoke;
  v8[3] = &unk_24CFEBF08;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __55__NPKPassAssociatedInfoModel__balanceByIDWithBalances___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_msgSend(v3, "isExpired") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)_commutePlansByIDWithPlans:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueIdentifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_balanceFieldWithPassField:(id)a3 balance:(id)a4 isPrimaryBalance:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PKPaymentPass *pass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NPKBalanceField *v24;
  void *v25;
  NPKBalanceField *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v12 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_HEADER_TRANSIT_BALANCE"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  objc_msgSend(v9, "formattedValue");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v12 && v16)
  {
    objc_msgSend(v9, "identifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    pass = self->_pass;
    objc_msgSend(v18, "anyObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:currentBalance:](pass, "npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:currentBalance:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKPassAssociatedInfoModel _actionWithIdentifiers:type:](self, "_actionWithIdentifiers:type:", v18, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = [NPKBalanceField alloc];
    objc_msgSend(v18, "anyObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[NPKBalanceField initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:](v24, "initWithBalance:label:formattedValue:identifier:primaryBalance:action:pendingUpdateExpireDate:", v9, v12, v17, v25, v5, v23, v22);

  }
  else
  {
    pk_General_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      pk_General_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v32 = v9;
        v33 = 2112;
        v34 = v12;
        v35 = 2112;
        v36 = v17;
        _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: Missing data from balance:%@ localizedTitle:%@ formattedValue:%@", buf, 0x20u);
      }

    }
    v26 = 0;
  }

  return v26;
}

- (id)_commutePlanFieldsWithBalancesByID:(id)a3 dynamicPlansByID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[PKPaymentPass isTransitPass](self->_pass, "isTransitPass"))
  {
    v49 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPKPassAssociatedInfoModel pass](self, "pass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v10, "transitCommutePlanType");

  -[NPKPassAssociatedInfoModel pass](self, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitCommutePlans");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __82__NPKPassAssociatedInfoModel__commutePlanFieldsWithBalancesByID_dynamicPlansByID___block_invoke;
  v58[3] = &unk_24CFEBF30;
  v58[4] = self;
  v13 = v6;
  v59 = v13;
  v14 = v9;
  v60 = v14;
  v48 = v7;
  v61 = v7;
  v15 = v8;
  v62 = v15;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v58);

  v47 = v15;
  if (objc_msgSend(v14, "count"))
  {
    v56 = 0uLL;
    v57 = 0uLL;
    v54 = 0uLL;
    v55 = 0uLL;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (!v17)
      goto LABEL_24;
    v18 = v17;
    v44 = v14;
    v45 = v6;
    v19 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v21, "identifier", v44, v45);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPassAssociatedInfoModel _actionWithIdentifier:type:](self, "_actionWithIdentifier:type:", v22, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[NPKPassAssociatedInfoModel pass](self, "pass");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "transitCommutePlanType");

        if (-[NPKPassAssociatedInfoModel _shouldAddCommutePlan:action:withBalancesByID:](self, "_shouldAddCommutePlan:action:withBalancesByID:", v21, v23, v13))
        {
          -[NPKPassAssociatedInfoModel _fieldForCommutePlan:action:isLegacyPass:balancedByID:](self, "_fieldForCommutePlan:action:isLegacyPass:balancedByID:", v21, v23, v25 == 1, v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v26);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v18);
  }
  else
  {
    v52 = 0uLL;
    v53 = 0uLL;
    v50 = 0uLL;
    v51 = 0uLL;
    v16 = v15;
    v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (!v27)
      goto LABEL_24;
    v28 = v27;
    v44 = v14;
    v45 = v6;
    v29 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v16);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v31, "identifier", v44, v45);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPassAssociatedInfoModel _actionWithIdentifier:type:](self, "_actionWithIdentifier:type:", v32, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[NPKPassAssociatedInfoModel pass](self, "pass");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "transitCommutePlanType");

        if (-[NPKPassAssociatedInfoModel _shouldAddCommutePlan:action:withBalancesByID:](self, "_shouldAddCommutePlan:action:withBalancesByID:", v31, v33, v13))
        {
          -[NPKPassAssociatedInfoModel _fieldForCommutePlan:action:isLegacyPass:balancedByID:](self, "_fieldForCommutePlan:action:isLegacyPass:balancedByID:", v31, v33, v35 == 1, v13);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v36);

        }
      }
      v28 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v28);
  }
  v14 = v44;
  v6 = v45;
LABEL_24:

  v7 = v48;
  if (v46 == 1
    || (-[NPKPassAssociatedInfoModel pass](self, "pass"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v37, "transitCommutePlans"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        v39 = objc_msgSend(v38, "count"),
        v38,
        v37,
        !v39))
  {
    -[NPKPassAssociatedInfoModel transitPassProperties](self, "transitPassProperties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "felicaProperties");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassAssociatedInfoModel _commutePlanWithFelicaPassProperties:](self, "_commutePlanWithFelicaPassProperties:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObjectsFromArray:", v42);

  }
LABEL_28:

  return v49;
}

void __82__NPKPassAssociatedInfoModel__commutePlanFieldsWithBalancesByID_dynamicPlansByID___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1[4];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_actionWithIdentifier:type:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "requiresAppletSourceOfTruth") & 1) != 0)
  {
    v30 = v6;
    objc_msgSend(v3, "passFieldForKey:", *MEMORY[0x24BE6F900]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "foreignReferenceIdentifiers");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v8)
      goto LABEL_14;
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(a1[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(a1[6], "addObject:", v3);
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v9);
LABEL_14:

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = a1;
    objc_msgSend(a1[7], "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (!v15)
      goto LABEL_32;
    v16 = v15;
    v17 = *(_QWORD *)v32;
LABEL_16:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v18);
      objc_msgSend(v3, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v20;
      v23 = v21;
      if (v22 == v23)
        break;
      v24 = v23;
      if (v22 && v23)
      {
        v25 = objc_msgSend(v22, "isEqualToString:", v23);

        if ((v25 & 1) == 0)
          goto LABEL_30;
        goto LABEL_25;
      }

LABEL_29:
LABEL_30:
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (!v16)
        {
LABEL_32:

          v6 = v30;
          goto LABEL_33;
        }
        goto LABEL_16;
      }
    }

LABEL_25:
    objc_msgSend(v3, "updateWithCommutePlanDetail:", v19);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAssociatedPlan:", v22);
    v26 = objc_msgSend(v22, "hasExpiredPlanDate");
    v27 = 6;
    if (v26)
      v27 = 8;
    objc_msgSend(v13[v27], "addObject:", v22);
    goto LABEL_29;
  }
  if (objc_msgSend(a1[4], "_shouldAddCommutePlan:action:withBalancesByID:", v3, v6, a1[5]))
    objc_msgSend(a1[6], "addObject:", v3);
LABEL_33:

}

- (id)_fieldForCommutePlan:(id)a3 action:(id)a4 isLegacyPass:(BOOL)a5 balancedByID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NPKDateRange *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPaymentPass *pass;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NPKCommutePlanField *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  NPKCommutePlanField *v33;
  NPKDateRange *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v36 = a4;
  v11 = a6;
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a5)
  {
    objc_msgSend(v12, "value");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
  }
  else
  {
    objc_msgSend(v12, "label");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [NPKDateRange alloc];
  objc_msgSend(v10, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expiryDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[NPKDateRange initWithStartDate:expirationDate:formatterStyle:](v16, "initWithStartDate:expirationDate:formatterStyle:", v17, v18, 3);

  -[NPKPassAssociatedInfoModel _rawCountValueWithCommutePlan:balancesByID:](self, "_rawCountValueWithCommutePlan:balancesByID:", v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  objc_msgSend(v10, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expiryDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPass npkPendingAddValueStateExpireDateForCommutePlanFieldWithIdentifier:expiryDate:rawCountValue:](pass, "npkPendingAddValueStateExpireDateForCommutePlanFieldWithIdentifier:expiryDate:rawCountValue:", v21, v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  pk_General_log();
  v24 = objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v21)
  {
    pk_General_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v14;
      v39 = 2112;
      v40 = v19;
      v41 = 2112;
      v42 = v23;
      _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Creating commute plan field with label: %@, tripCount: %@, pendingUpdateExpireDate: %@", buf, 0x20u);
    }

  }
  v26 = [NPKCommutePlanField alloc];
  -[NPKPassAssociatedInfoModel _formattedValueWithCommutePlan:balancesByID:](self, "_formattedValueWithCommutePlan:balancesByID:", v10, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v28 = (void *)v14;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "details");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = objc_msgSend(v10, "isDeviceBound");
  v33 = -[NPKCommutePlanField initWithLabel:detailLabel:formattedValue:rawCountValue:usageDateRange:identifier:details:action:isDeviceBound:pendingUpdateExpireDate:](v26, "initWithLabel:detailLabel:formattedValue:rawCountValue:usageDateRange:identifier:details:action:isDeviceBound:pendingUpdateExpireDate:", v28, v35, v27, v19, v34, v29, v30, v36, v32, v23);

  return v33;
}

- (BOOL)_shouldAddCommutePlan:(id)a3 action:(id)a4 withBalancesByID:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  _BYTE *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "properties");
  objc_msgSend(v8, "expiryDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_9;
  v13 = (v11 & 1) == 0;
  objc_msgSend(v8, "expiryDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15);

  v17 = v16 == 1 || v13;
  if ((v17 & 1) != 0
    || (objc_msgSend(v9, "isActionAvailable") & 1) != 0
    || (objc_msgSend(v8, "isPlanDisplayable") & 1) != 0)
  {
LABEL_9:
    if (-[NPKPassAssociatedInfoModel isCommutePlanValueRequired](self, "isCommutePlanValueRequired")
      && (objc_msgSend(v8, "properties") & 4) != 0)
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0;
      *(_QWORD *)v46 = 0;
      *(_QWORD *)&v46[8] = v46;
      *(_QWORD *)&v46[16] = 0x3032000000;
      v47 = __Block_byref_object_copy__17;
      v48 = __Block_byref_object_dispose__17;
      v49 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      objc_msgSend(v8, "details");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __76__NPKPassAssociatedInfoModel__shouldAddCommutePlan_action_withBalancesByID___block_invoke;
      v33[3] = &unk_24CFEBF58;
      v36 = v46;
      v37 = &v38;
      v34 = v10;
      v35 = v9;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v33);

      if (!*((_BYTE *)v39 + 24))
      {
        pk_General_log();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

        if (v21)
        {
          pk_General_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = *(_QWORD *)(*(_QWORD *)&v46[8] + 40);
            *(_DWORD *)buf = 138412546;
            v43 = v23;
            v44 = 2112;
            v45 = v24;
            _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: should not add commute plan with identifier:%@. decision detail: %@", buf, 0x16u);

          }
        }
      }
      v18 = *((_BYTE *)v39 + 24) != 0;

      _Block_object_dispose(v46, 8);
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      v18 = 1;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "expiryDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR(" is timed commute plan:%d, is expired:%d, expiry date:%@, is action available:%d"), 1, 1, v26, objc_msgSend(v9, "isActionAvailable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    pk_General_log();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (v29)
    {
      pk_General_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v46 = 138412546;
        *(_QWORD *)&v46[4] = v31;
        *(_WORD *)&v46[12] = 2112;
        *(_QWORD *)&v46[14] = v27;
        _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: should not add commute plan with identifier:%@. decision detail:%@", v46, 0x16u);

      }
    }

    v18 = 0;
  }

  return v18;
}

void __76__NPKPassAssociatedInfoModel__shouldAddCommutePlan_action_withBalancesByID___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foreignReferenceIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("\nverifying pass field with key - label - value - fRefID:%@ - %@ - %@ - %@."), v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v13);

  objc_msgSend(v6, "foreignReferenceIdentifiers");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v6, "foreignReferenceType") - 1) <= 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21 != 0;

          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
            || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", CFSTR(" balance by ID no value.")), (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "isActionAvailable")) != 0))
          {
            v22 = 1;
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", CFSTR(" action is not available."));
            v22 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          }
          *a4 = v22;
          goto LABEL_15;
        }
        if (a4)
          goto LABEL_15;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_15:

}

- (id)_formattedValueWithCommutePlan:(id)a3 balancesByID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "properties") & 4) != 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__17;
    v17 = __Block_byref_object_dispose__17;
    v18 = 0;
    objc_msgSend(v5, "details");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__NPKPassAssociatedInfoModel__formattedValueWithCommutePlan_balancesByID___block_invoke;
    v10[3] = &unk_24CFEBF80;
    v11 = v6;
    v12 = &v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __74__NPKPassAssociatedInfoModel__formattedValueWithCommutePlan_balancesByID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "foreignReferenceIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v5, "foreignReferenceType") - 1) <= 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            pk_General_log();
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

            v13 = &unk_24D056638;
            if (v15)
            {
              pk_General_log();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v28 = v5;
                v29 = 2112;
                v30 = v17;
                _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoModel: Using default balance value 0 for field:%@ balance:%@", buf, 0x16u);

              }
              v13 = &unk_24D056638;
            }
          }
          objc_msgSend(v5, "unitType");
          PKLocalizedPaymentUnitKeyForType();
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (v18)
            PKLocalizedPaymentString(v18, CFSTR("%lu"), objc_msgSend(v13, "unsignedLongValue"));
          else
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v13, "integerValue"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

          *a4 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }

}

- (id)_rawCountValueWithCommutePlan:(id)a3 balancesByID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__17;
  v17 = __Block_byref_object_dispose__17;
  v18 = 0;
  if ((objc_msgSend(v5, "properties") & 4) != 0)
  {
    objc_msgSend(v5, "details");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__NPKPassAssociatedInfoModel__rawCountValueWithCommutePlan_balancesByID___block_invoke;
    v10[3] = &unk_24CFEBFA8;
    v12 = &v13;
    v11 = v6;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    v7 = (id)v14[5];
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __73__NPKPassAssociatedInfoModel__rawCountValueWithCommutePlan_balancesByID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "foreignReferenceIdentifiers");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if ((unint64_t)(objc_msgSend(v6, "foreignReferenceType", (_QWORD)v17) - 1) <= 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        *a4 = 1;
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_commutePlanWithFelicaPassProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, void *, void *, void *, void *);
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void (**v66)(_QWORD, void *, void *, void *, void *);
  id v67;
  void *v68;
  _QWORD v69[4];
  void (**v70)(_QWORD, void *, void *, void *, void *);
  _QWORD v71[4];
  id v72;
  uint8_t buf[4];
  int v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
    goto LABEL_21;
  v6 = MEMORY[0x24BDAC760];
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke;
  v71[3] = &unk_24CFEBFD0;
  v68 = v4;
  v67 = v4;
  v72 = v67;
  v7 = (void (**)(_QWORD, void *, void *, void *, void *))MEMORY[0x2199B6780](v71);
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v3, "hasShinkansenTicket");
      *(_DWORD *)buf = 67109120;
      v74 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKTransitBalanceModel: has Shinkansen ticket:%d", buf, 8u);
    }

  }
  v66 = v7;
  if (objc_msgSend(v3, "hasShinkansenTicket"))
  {
    v69[0] = v6;
    v69[1] = 3221225472;
    v69[2] = __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke_75;
    v69[3] = &unk_24CFEBFF8;
    v70 = v7;
    v63 = MEMORY[0x2199B6780](v69);
    objc_msgSend(v3, "shinkansenValidityTerm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenValidityStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v12;
    v15 = objc_msgSend(v12, "integerValue");
    v58 = v13;
    objc_msgSend(v13, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v14;
    objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, v15, v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "shinkansenValidityStartDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenOriginStation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenDestinationStation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenDepartureTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenArrivalTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenTrainName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenCarNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayableShinkansenSeat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v17;
    (*(void (**)(uint64_t, void *, void *, void *, void *, void *, void *, void *, void *, uint64_t, _BYTE))(v63 + 16))(v63, v18, v19, v20, v21, v22, v23, v24, v25, v17, objc_msgSend(v3, "isShinkansenTicketActive"));

    objc_msgSend(v3, "shinkansenSecondaryOriginStation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26
      || (objc_msgSend(v3, "shinkansenSecondaryDestinationStation"),
          (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

      v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD))v63;
    }
    else
    {
      objc_msgSend(v3, "shinkansenSecondaryTrainName");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD))v63;
      if (!v54)
        goto LABEL_11;
    }
    objc_msgSend(v3, "shinkansenValidityStartDate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenSecondaryOriginStation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenSecondaryDestinationStation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenSecondaryDepartureTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenSecondaryArrivalTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenSecondaryTrainName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shinkansenSecondaryCarNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayableShinkansenSecondarySeat");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v55) = objc_msgSend(v3, "isShinkansenTicketActive");
    ((void (**)(_QWORD, void *, void *, void *, void *, void *, void *, void *, void *, void *, int))v27)[2](v27, v28, v29, v30, v31, v32, v33, v34, v35, v61, v55);

LABEL_11:
    v7 = v66;
  }
  pk_General_log();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

  if (v37)
  {
    pk_General_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v3, "hasGreenCarTicket");
      *(_DWORD *)buf = 67109120;
      v74 = v39;
      _os_log_impl(&dword_213518000, v38, OS_LOG_TYPE_DEFAULT, "Notice: NPKTransitBalanceModel: has Green Car ticket ticket:%d", buf, 8u);
    }

  }
  if (objc_msgSend(v3, "hasGreenCarTicket"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "greenCarValidityStartDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "calendar");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v41;
    objc_msgSend(v41, "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v42;
    objc_msgSend(v42, "dateByAddingUnit:value:toDate:options:", 16, 1, v43, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "greenCarOriginStation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "greenCarDestinationStation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    __NPKRouteDescriptionForStations(v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
      objc_msgSend(v40, "addObject:", v46);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_HEADER_GREEN_CAR_UPGRADE"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "greenCarValidityStartDate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "date");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v66;
    v66[2](v66, v48, v49, v51, v62);

  }
  v52 = v67;

  v5 = v68;
LABEL_21:

  return v5;
}

void __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NPKDateRange *v14;
  NPKCommutePlanField *v15;
  void *v16;
  void *v17;
  NPKCommutePlanField *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11
    || (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "compare:", v11),
        v12,
        v13 != 1))
  {
    v14 = -[NPKDateRange initWithStartDate:expirationDate:formatterStyle:]([NPKDateRange alloc], "initWithStartDate:expirationDate:formatterStyle:", v10, v11, 3);
    v15 = [NPKCommutePlanField alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = 0;
    v18 = -[NPKCommutePlanField initWithLabel:detailLabel:formattedValue:rawCountValue:usageDateRange:identifier:details:action:isDeviceBound:pendingUpdateExpireDate:](v15, "initWithLabel:detailLabel:formattedValue:rawCountValue:usageDateRange:identifier:details:action:isDeviceBound:pendingUpdateExpireDate:", v20, v9, 0, 0, v14, v17, 0, 0, v19, 0);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
  }

}

void __67__NPKPassAssociatedInfoModel__commutePlanWithFelicaPassProperties___block_invoke_75(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, char a11)
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v65 = a3;
  v17 = a4;
  v64 = a5;
  v63 = a6;
  v62 = a7;
  v66 = a8;
  v18 = a9;
  v19 = a10;
  v20 = (void *)MEMORY[0x24BDBCE60];
  v58 = a2;
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v19;
  v22 = objc_msgSend(v21, "compare:", v19);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == -1 && (a11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_STATUS_VALUE_INACTIVE"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v25);

  }
  v26 = v18;
  __NPKRouteDescriptionForStations(v65, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v23, "addObject:", v27);
  objc_msgSend(v64, "date");
  v28 = v66;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v29 = v17;
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v61, 0, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_VALUE_DEPARTURE_TIME"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", v33, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      objc_msgSend(v23, "addObject:", v34);

    v17 = v29;
  }
  objc_msgSend(v63, "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = v17;
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v35, 0, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_VALUE_ARRIVAL_TIME"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", v40, v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      objc_msgSend(v23, "addObject:", v41);

    v17 = v36;
    v28 = v66;
  }
  v42 = v62;
  if (v62)
    objc_msgSend(v23, "addObject:", v62);
  v43 = v26;
  if (v28)
  {
    v44 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_VALUE_CAR_ASSIGNMENT"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      objc_msgSend(v23, "addObject:", v48);

    v42 = v62;
    v43 = v26;
  }
  if (v43)
  {
    v49 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_VALUE_SEAT_ASSIGNMENT"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v43;
    v53 = (void *)v51;
    objc_msgSend(v49, "stringWithFormat:", v51, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
      objc_msgSend(v23, "addObject:", v54);

    v43 = v26;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("PASS_DETAILS_HEADER_SHINKANSEN"), &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_actionWithIdentifier:(id)a3 type:(unint64_t)a4
{
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[NPKPassAssociatedInfoModel _actionWithIdentifiers:type:](self, "_actionWithIdentifiers:type:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_actionWithIdentifiers:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKPaymentPass availableActions](self->_pass, "availableActions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NPKPassAssociatedInfoModel _identifierFromAction:type:](self, "_identifierFromAction:type:", v12, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type") == a4 && (!v6 || (objc_msgSend(v6, "containsObject:", v13) & 1) != 0))
        {
          v14 = v12;

          goto LABEL_13;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)_identifierFromAction:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 2)
  {
    objc_msgSend(v5, "associatedPlanIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "associatedEnteredValueIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (id)_balancePassFieldsFromPass:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "isStoredValuePass"))
  {
    objc_msgSend(v3, "balanceFields");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(v3, "isAccessPass"))
    {
      objc_msgSend(v3, "balanceFields");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        objc_msgSend(v3, "balanceFields");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObjectsFromArray:", v6);

      }
    }
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v3, "frontFieldBuckets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    v26 = v3;
    objc_msgSend(v3, "backFieldBuckets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v7;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v43;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(obj);
          v30 = v11;
          v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v11);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v33 = v12;
          v13 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v39;
            do
            {
              v16 = 0;
              v32 = v14;
              do
              {
                if (*(_QWORD *)v39 != v15)
                  objc_enumerationMutation(v33);
                v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
                if (objc_msgSend(v17, "foreignReferenceType") == 1)
                {
                  objc_msgSend(v17, "foreignReferenceIdentifiers");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = 0u;
                  v35 = 0u;
                  v36 = 0u;
                  v37 = 0u;
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                  if (v19)
                  {
                    v20 = v19;
                    v21 = 0;
                    v22 = *(_QWORD *)v35;
                    do
                    {
                      for (i = 0; i != v20; ++i)
                      {
                        if (*(_QWORD *)v35 != v22)
                          objc_enumerationMutation(v18);
                        v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
                        if ((objc_msgSend(v10, "containsObject:", v24) & 1) == 0)
                        {
                          objc_msgSend(v10, "addObject:", v24);
                          v21 = 1;
                        }
                      }
                      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                    }
                    while (v20);
                    v14 = v32;
                    if ((v21 & 1) != 0)
                      objc_msgSend(v31, "addObject:", v17);
                  }

                }
                ++v16;
              }
              while (v16 != v14);
              v14 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            }
            while (v14);
          }

          v11 = v30 + 1;
        }
        while (v30 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v29);
    }

    v3 = v26;
  }

  return v31;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[NPKPassAssociatedInfoModel pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel balanceFields](self, "balanceFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> {passUniqueID:%@, balanceFields:%@"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassAssociatedInfoModel transitPassProperties](self, "transitPassProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NPKPassAssociatedInfoModel transitPassProperties](self, "transitPassProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" transitPassProperties:%@"), v10);

  }
  -[NPKPassAssociatedInfoModel balances](self, "balances");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[NPKPassAssociatedInfoModel balances](self, "balances");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" balances:%@"), v13);

  }
  objc_msgSend(v8, "appendString:", CFSTR("}"));
  return v8;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (NSArray)balanceFields
{
  return self->_balanceFields;
}

- (NSArray)commutePlanFields
{
  return self->_commutePlanFields;
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (void)setTransitAppletState:(id)a3
{
  objc_storeStrong((id *)&self->_transitAppletState, a3);
}

- (PKTransitPassProperties)transitPassProperties
{
  return self->_transitPassProperties;
}

- (NSSet)balances
{
  return self->_balances;
}

- (NSArray)dynamicPlans
{
  return self->_dynamicPlans;
}

- (NSArray)tiles
{
  return self->_tiles;
}

- (unint64_t)rangingSuspensionReason
{
  return self->_rangingSuspensionReason;
}

- (void)setRangingSuspensionReason:(unint64_t)a3
{
  self->_rangingSuspensionReason = a3;
}

- (PKPrecursorPassUpgradeRequestDescription)precursorPassDescription
{
  return self->_precursorPassDescription;
}

- (void)setPrecursorPassDescription:(id)a3
{
  objc_storeStrong((id *)&self->_precursorPassDescription, a3);
}

- (BOOL)isCommutePlanValueRequired
{
  return self->_commutePlanValueRequired;
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
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
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_dynamicPlans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_transitPassProperties, 0);
  objc_storeStrong((id *)&self->_transitAppletState, 0);
  objc_storeStrong((id *)&self->_commutePlanFields, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
