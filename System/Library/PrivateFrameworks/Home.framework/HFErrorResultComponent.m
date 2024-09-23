@implementation HFErrorResultComponent

+ (id)componentForWriteErrorForCharacteristics:(id)a3 valueSource:(id)a4
{
  id v5;
  id v6;
  HFErrorResultComponent *v7;
  id v8;
  uint64_t v9;
  HFErrorResultComponent *i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  BOOL v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !+[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v7 = (HFErrorResultComponent *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v7; i = (HFErrorResultComponent *)((char *)i + 1))
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v8);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v6, "cachedErrorForWriteToCharacteristic:", v11, (_QWORD)v22);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            HFLogForCategory(0x38uLL);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v27 = v13;
              v28 = 2112;
              v29 = v11;
              _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Displaying cached write error %@ for characteristic %@", buf, 0x16u);
            }

            v7 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 6);
            v15 = objc_msgSend(v13, "hf_isHMErrorWithCode:", 87);
            v16 = v15 == 0;
            if (v15)
              v17 = CFSTR("HFServiceDescriptionActionRequiredInManufacturerApp");
            else
              v17 = CFSTR("HFServiceItemDescriptionFailure");
            if (v16)
              v18 = CFSTR("HFServiceItemDescriptionFailure");
            else
              v18 = CFSTR("HFServiceLongFormErrorActionRequiredInManufacturerApp");
            _HFLocalizedStringWithDefaultValue(v17, v17, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFErrorResultComponent setErrorDescription:](v7, "setErrorDescription:", v19);

            _HFLocalizedStringWithDefaultValue(v18, v18, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFErrorResultComponent setDetailedErrorDescription:](v7, "setDetailedErrorDescription:", v20);

            goto LABEL_22;
          }
        }
        v7 = (HFErrorResultComponent *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_22:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)componentForAccessoryReprovisionState:(unint64_t)a3
{
  HFErrorResultComponent *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 0);
    -[HFErrorResultComponent setDisplayPriority:](v4, "setDisplayPriority:", 1);
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryConnectionError"), CFSTR("HFServiceDescriptionAccessoryConnectionError"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFErrorResultComponent setErrorDescription:](v4, "setErrorDescription:", v5);

    HFLocalizedWiFiString(CFSTR("HFServiceLongFormPersistentWarngingHomeKitReWAC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFErrorResultComponent setErrorMessageTitle:](v4, "setErrorMessageTitle:", v6);

    if (a3 == 2)
    {
      -[HFErrorResultComponent setUpdateInProgress:](v4, "setUpdateInProgress:", 1);
    }
    else if (a3 == 1)
    {
      HFLocalizedWiFiString(CFSTR("HFServiceActionMessageReWAC"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorMessageButtonTitle:](v4, "setErrorMessageButtonTitle:", v7);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (HFErrorResultComponent)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCategory_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFErrorResultComponent.m"), 29, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFErrorResultComponent init]",
    v5);

  return 0;
}

- (HFErrorResultComponent)initWithCategory:(unint64_t)a3
{
  HFErrorResultComponent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFErrorResultComponent;
  result = -[HFErrorResultComponent init](&v5, sel_init);
  if (result)
  {
    result->_category = a3;
    result->_badgeType = 1;
    result->_descriptionBadgeType = 0;
  }
  return result;
}

- (int64_t)componentPriority
{
  return objc_msgSend((id)objc_opt_class(), "priorityForCategory:", -[HFErrorResultComponent category](self, "category"));
}

- (id)results
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
  void *v13;
  uint64_t v14;

  v3 = (void *)objc_opt_new();
  -[HFErrorResultComponent underlyingSymptom](self, "underlyingSymptom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("symptom"));

  -[HFErrorResultComponent errorDescription](self, "errorDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDescription"));

  -[HFErrorResultComponent detailedErrorDescription](self, "detailedErrorDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("longErrorDescription"));

  -[HFErrorResultComponent errorMessageTitle](self, "errorMessageTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorMessageTitle"));

  -[HFErrorResultComponent errorMessageButtonTitle](self, "errorMessageButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorMessageButtonTitle"));

  -[HFErrorResultComponent errorHandlerURL](self, "errorHandlerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("errorHandlerURL"));

  -[HFErrorResultComponent errorHandlerURLText](self, "errorHandlerURLText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("errorHandlerURLText"));

  if (-[HFErrorResultComponent displayPriority](self, "displayPriority"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFErrorResultComponent displayPriority](self, "displayPriority"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("priority"));

  }
  if (-[HFErrorResultComponent badgeType](self, "badgeType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFErrorResultComponent badgeType](self, "badgeType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("badge"));

  }
  if (-[HFErrorResultComponent descriptionBadgeType](self, "descriptionBadgeType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFErrorResultComponent descriptionBadgeType](self, "descriptionBadgeType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("descriptionBadge"));

  }
  if (-[HFErrorResultComponent updateInProgress](self, "updateInProgress"))
  {
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("updateInProgress"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isInStateTransition"));
  }
  return v3;
}

+ (int64_t)priorityForCategory:(unint64_t)a3
{
  return 1000 - a3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFErrorResultComponent category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("category"));

  -[HFErrorResultComponent errorDescription](self, "errorDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("description"));

  -[HFErrorResultComponent underlyingSymptom](self, "underlyingSymptom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("symptom"), 1);

  -[HFErrorResultComponent errorHandlerURL](self, "errorHandlerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("handler"), 1);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)category
{
  return self->_category;
}

- (HMSymptom)underlyingSymptom
{
  return self->_underlyingSymptom;
}

- (void)setUnderlyingSymptom:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingSymptom, a3);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)detailedErrorDescription
{
  return self->_detailedErrorDescription;
}

- (void)setDetailedErrorDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)displayPriority
{
  return self->_displayPriority;
}

- (void)setDisplayPriority:(int64_t)a3
{
  self->_displayPriority = a3;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (unint64_t)descriptionBadgeType
{
  return self->_descriptionBadgeType;
}

- (void)setDescriptionBadgeType:(unint64_t)a3
{
  self->_descriptionBadgeType = a3;
}

- (NSString)errorMessageTitle
{
  return self->_errorMessageTitle;
}

- (void)setErrorMessageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)errorMessageButtonTitle
{
  return self->_errorMessageButtonTitle;
}

- (void)setErrorMessageButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)errorHandlerURL
{
  return self->_errorHandlerURL;
}

- (void)setErrorHandlerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)errorHandlerURLText
{
  return self->_errorHandlerURLText;
}

- (void)setErrorHandlerURLText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorHandlerURLText, 0);
  objc_storeStrong((id *)&self->_errorHandlerURL, 0);
  objc_storeStrong((id *)&self->_errorMessageButtonTitle, 0);
  objc_storeStrong((id *)&self->_errorMessageTitle, 0);
  objc_storeStrong((id *)&self->_detailedErrorDescription, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_underlyingSymptom, 0);
}

+ (id)componentForDisplayError:(id)a3 symptomContextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  HFErrorResultComponent *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NSLog(CFSTR("%s called without a display error!"), "+[HFErrorResultComponent(HFServiceLikeItem) componentForDisplayError:symptomContextProvider:]");
    goto LABEL_6;
  }
  if (+[HFUtilities shouldSuppressAllErrorsForDemo](HFUtilities, "shouldSuppressAllErrorsForDemo"))
  {
LABEL_6:
    v10 = 0;
    goto LABEL_23;
  }
  switch(objc_msgSend(v6, "category"))
  {
    case 0:
    case 1:
      objc_msgSend(v6, "contextProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "componentForUnreachableAccessoryWithContextProvider:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 1);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionUnavailable"), CFSTR("HFServiceDescriptionUnavailable"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v11);

      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryUnavailable"), CFSTR("HFServiceDescriptionAccessoryUnavailable"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setDetailedErrorDescription:](v10, "setDetailedErrorDescription:", v12);

      v13 = CFSTR("HFServiceLongFormErrorNoThreadNetworkNoResident");
      goto LABEL_10;
    case 3:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 1);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionUnavailable"), CFSTR("HFServiceDescriptionUnavailable"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v14);

      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryUnavailable"), CFSTR("HFServiceDescriptionAccessoryUnavailable"), 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setDetailedErrorDescription:](v10, "setDetailedErrorDescription:", v15);

      v13 = CFSTR("HFServiceLongFormErrorNoThreadNetworkResidentWithoutThread");
      goto LABEL_10;
    case 4:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 1);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionUnavailable"), CFSTR("HFServiceDescriptionUnavailable"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v16);

      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryUnavailable"), CFSTR("HFServiceDescriptionAccessoryUnavailable"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setDetailedErrorDescription:](v10, "setDetailedErrorDescription:", v17);

      v13 = CFSTR("HFServiceLongFormErrorNoThreadNetworkLocal");
LABEL_10:
      _HFLocalizedStringWithDefaultValue(v13, v13, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorMessageTitle:](v10, "setErrorMessageTitle:", v18);

      objc_msgSend(MEMORY[0x1E0C99E98], "hf_homeHubRequiredLearnMoreURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorHandlerURL:](v10, "setErrorHandlerURL:", v19);

      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceErrorNoThreadNetworkLearnMoreTitle"), CFSTR("HFServiceErrorNoThreadNetworkLearnMoreTitle"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorHandlerURLText:](v10, "setErrorHandlerURLText:", v8);
      goto LABEL_22;
    case 5:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 2);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryNotSupported"), CFSTR("HFServiceDescriptionAccessoryNotSupported"), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v20);

      v21 = CFSTR("HFServiceLongFormErrorDoesNotSupportNotifications");
      goto LABEL_20;
    case 6:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 4);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionActionRequiredInManufacturerApp"), CFSTR("HFServiceDescriptionActionRequiredInManufacturerApp"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v22);

      v21 = CFSTR("HFServiceLongFormErrorActionRequiredInManufacturerApp");
      goto LABEL_20;
    case 7:
      objc_msgSend(v6, "underlyingSymptom");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "componentForSymptom:contextProvider:", v8, v7);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v10 = (HFErrorResultComponent *)v9;
      goto LABEL_22;
    case 8:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 3);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessorySplitMediaAccountErrorDescription"), CFSTR("HFMediaAccessorySplitMediaAccountErrorDescription"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v23);

      _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessorySplitMediaAccountErrorDescription"), CFSTR("HFMediaAccessorySplitMediaAccountErrorDescription"), 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setDetailedErrorDescription:](v10, "setDetailedErrorDescription:", v24);

      -[HFErrorResultComponent setDescriptionBadgeType:](v10, "setDescriptionBadgeType:", 4);
      -[HFErrorResultComponent setDisplayPriority:](v10, "setDisplayPriority:", 1);
      break;
    case 9:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 3);
      _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory"), CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory"), 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setErrorDescription:](v10, "setErrorDescription:", v25);

      v21 = CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory");
      v26 = CFSTR("HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory");
      goto LABEL_21;
    case 10:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 3);
      v21 = CFSTR("HFSiriEndpointAccessoryRequestingSessionErrorDescription");
      goto LABEL_20;
    case 11:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 3);
      v21 = CFSTR("HFSiriEndpointAccessorySessionDroppedErrorDescription");
      goto LABEL_20;
    case 12:
      v10 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 3);
      v21 = CFSTR("HFSiriEndpointAccessorySiriDisabledErrorDescription");
LABEL_20:
      v26 = v21;
LABEL_21:
      _HFLocalizedStringWithDefaultValue(v21, v26, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFErrorResultComponent setDetailedErrorDescription:](v10, "setDetailedErrorDescription:", v8);
LABEL_22:

      break;
    default:
      goto LABEL_6;
  }
LABEL_23:

  return v10;
}

+ (id)componentForUnreachableAccessoryWithContextProvider:(id)a3
{
  id v3;
  HFErrorResultComponent *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v3 = a3;
  v4 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 1);
  v5 = objc_msgSend(v3, "hf_remoteAccessState");
  if (v5)
    v6 = v5;
  else
    v6 = 3;
  v7 = v3;
  v8 = objc_msgSend(v7, "hf_isUserAtHome");
  if ((unint64_t)(v6 - 3) < 0xFFFFFFFFFFFFFFFELL)
    v9 = 1;
  else
    v9 = v8;
  -[HFErrorResultComponent setDisplayPriority:](v4, "setDisplayPriority:", v9);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_2;
  v22[3] = &unk_1EA73CA88;
  v11 = v7;
  v23 = v11;
  v24 = v6;
  __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_2((uint64_t)v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFErrorResultComponent setErrorDescription:](v4, "setErrorDescription:", v12);

  v16 = v10;
  v17 = 3221225472;
  v18 = __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_3;
  v19 = &unk_1EA73CA88;
  v20 = v11;
  v21 = v6;
  v13 = v11;
  __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_3((uint64_t)&v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFErrorResultComponent setDetailedErrorDescription:](v4, "setDetailedErrorDescription:", v14, v16, v17, v18, v19);

  return v4;
}

id __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "hf_isUserAtHome");
  if ((_DWORD)v2)
    goto LABEL_8;
  v3 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v3 - 1) < 2)
  {
    v5 = CFSTR("HFServiceDescriptionUnavailable");
    goto LABEL_10;
  }
  if (v3 == 3 || v3 == 0)
  {
LABEL_8:
    v5 = CFSTR("HFServiceDescriptionNoResponse");
LABEL_10:
    _HFLocalizedStringWithDefaultValue(v5, v5, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id __97__HFErrorResultComponent_HFServiceLikeItem__componentForUnreachableAccessoryWithContextProvider___block_invoke_3(uint64_t a1)
{
  void *v2;
  __CFString *v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "hf_isUserAtHome");
  if ((_DWORD)v2)
  {
LABEL_3:
    v3 = CFSTR("HFServiceLongFormErrorNotReachable");
LABEL_4:
    _HFLocalizedStringWithDefaultValue(v3, v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    switch(*(_QWORD *)(a1 + 40))
    {
      case 0:
      case 3:
        goto LABEL_3;
      case 1:
        v3 = CFSTR("HFServiceLongFormErrorNoResidentDevice");
        goto LABEL_4;
      case 2:
        v3 = CFSTR("HFServiceLongFormErrorResidentDeviceNotReachable");
        goto LABEL_4;
      default:
        return v2;
    }
  }
  return v2;
}

+ (id)componentForSymptom:(id)a3 contextProvider:(id)a4
{
  id v7;
  id v8;
  HFErrorResultComponent *v9;
  uint64_t v10;
  HFErrorResultComponent *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  void *v95;
  id v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  __CFString *v102;
  void *v103;
  void *v104;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  id v135;
  uint8_t buf[4];
  uint64_t v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
    NSLog(CFSTR("%s without a symptom!"), "+[HFErrorResultComponent(HFServiceLikeItem) componentForSymptom:contextProvider:]");
  if (objc_msgSend(a1, "_requiresManualFixOptionToDisplaySymptom:", v7)
    && !objc_msgSend(v8, "shouldDisplayManualFixOptionForSymptom:", v7))
  {
    v11 = 0;
  }
  else
  {
    v9 = -[HFErrorResultComponent initWithCategory:]([HFErrorResultComponent alloc], "initWithCategory:", 3);
    -[HFErrorResultComponent setUnderlyingSymptom:](v9, "setUnderlyingSymptom:", v7);
    -[HFErrorResultComponent setDisplayPriority:](v9, "setDisplayPriority:", objc_msgSend(a1, "_displayPriorityForSymptom:", v7));
    v10 = objc_msgSend(v7, "type");
    v11 = 0;
    switch(v10)
    {
      case 1:
      case 20:
        objc_msgSend(v8, "detailedErrorDescriptionForiCloudSymptom");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v12);

        -[HFErrorResultComponent setDescriptionBadgeType:](v9, "setDescriptionBadgeType:", 4);
        objc_msgSend(v8, "currentUserID");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomLongDescriptionNeediTunesCredential"), CFSTR("HFSymptomLongDescriptionNeediTunesCredential"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v15);

        -[HFErrorResultComponent setDescriptionBadgeType:](v9, "setDescriptionBadgeType:", 4);
        objc_msgSend(v8, "currentAppleMusicAccountName");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v16 = (void *)v13;
        -[HFErrorResultComponent _addAccountSymptomMessageForAccountName:symptom:](v9, "_addAccountSymptomMessageForAccountName:symptom:", v13, v7);
        goto LABEL_57;
      case 3:
        objc_msgSend(v8, "accessoryName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionHomekitProblem"), CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);
        goto LABEL_32;
      case 4:
        if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
        {
          objc_msgSend(v8, "currentDeviceNetworkSSID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("AppleWiFi"));

          if (v24)
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            HFLocalizedWiFiString(CFSTR("HFSymptomLongDescriptionWifiUnsupportedNetwork"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = 0;
            objc_msgSend(v8, "homeKitObjectName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "currentDeviceNetworkSSID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithValidatedFormat:validFormatSpecifiers:error:", v26, CFSTR("%@ %@"), &v135, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v135;
            -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v29);

            goto LABEL_58;
          }
        }
        v95 = (void *)MEMORY[0x1E0CB3940];
        HFLocalizedWiFiString(CFSTR("HFSymptomLongDescriptionWifiConnectionProblem"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = 0;
        objc_msgSend(v8, "homeKitObjectName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "stringWithValidatedFormat:validFormatSpecifiers:error:", v49, CFSTR("%@"), &v134, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v134;
LABEL_46:
        v96 = v52;
        -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v51);

        goto LABEL_86;
      case 5:
        HFLocalizedWiFiString(CFSTR("HFSymptomStatusTextWiFiLostConnection"));
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      case 6:
      case 15:
        goto LABEL_73;
      case 7:
        objc_msgSend(v8, "accessoryName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionHardwareFailure"), CFSTR("%@"), v33, v34, v35, v36, v37, v38, (uint64_t)v32);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v39);

        _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomLongDescriptionHardwareFailureContactSupport"), CFSTR("HFSymptomLongDescriptionHardwareFailureContactSupport"), 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setErrorMessageTitle:](v9, "setErrorMessageTitle:", v40);

        _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomLongDescriptionHardwareFailureContactSupport"), CFSTR("HFSymptomLongDescriptionHardwareFailureContactSupport"), 1);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 8:
        objc_msgSend(v8, "homeKitObjectName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFSymptomDetailedDescriptionStereoVersionMismatch"), CFSTR("%@"), v42, v43, v44, v45, v46, v47, (uint64_t)v16);
        goto LABEL_32;
      case 9:
        v14 = CFSTR("HFSymptomDetailedDescriptionStereoNotFound");
        goto LABEL_50;
      case 10:
        v48 = (void *)MEMORY[0x1E0CB3940];
        HFLocalizedWiFiString(CFSTR("HFSymptomDetailedDescriptionStereoError"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = 0;
        objc_msgSend(v8, "homeKitObjectName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithValidatedFormat:validFormatSpecifiers:error:", v49, CFSTR("%@"), &v131, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v131;
        goto LABEL_46;
      case 11:
        objc_msgSend(v8, "currentDeviceNetworkSSID");
        v53 = objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          v16 = (void *)v53;
          HFLocalizedWiFiString(CFSTR("HFSymptomLongDescriptionProblemWifiMismatch"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accessoryNetworkSSID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            v56 = (void *)MEMORY[0x1E0CB3940];
            v133 = 0;
            objc_msgSend(v8, "accessoryNetworkSSID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringWithValidatedFormat:validFormatSpecifiers:error:", v54, CFSTR("%@"), &v133, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v133;
            -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v58);

          }
          else
          {
            HFLocalizedWiFiString(CFSTR("HFSymptomLongDescriptionProblemWifiMismatchNone"));
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v106);

          }
          objc_msgSend(v8, "accessoryUUID");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (v107)
          {
            objc_msgSend(v8, "accessoryUUID");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            +[HFURLComponents fixSymptomURLForAccessoryWithUUID:symptom:](HFURLComponents, "fixSymptomURLForAccessoryWithUUID:symptom:", v114, v7);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFErrorResultComponent setErrorHandlerURL:](v9, "setErrorHandlerURL:", v115);

          }
          HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionProblemWifiMisMatchLinkString"), CFSTR("%@"), v108, v109, v110, v111, v112, v113, (uint64_t)v16);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFErrorResultComponent setErrorHandlerURLText:](v9, "setErrorHandlerURLText:", v116);

          goto LABEL_33;
        }
        HFLogForCategory(0);
        v97 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        goto LABEL_88;
      case 12:
        v14 = CFSTR("HFSymptomDetailedDescriptionTargetControlMissing");
        goto LABEL_50;
      case 13:
        v14 = CFSTR("HFSymptomLongDescriptionVPNProfileExpired");
        goto LABEL_50;
      case 14:
        HFLocalizedWiFiString(CFSTR("HFSymptomLongDescription8021xNetworkProblem"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v60);

        if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
          goto LABEL_58;
        HFLocalizedWiFiString(CFSTR("HFSymptomActionMessageWifiSettings"));
        v41 = objc_claimAutoreleasedReturnValue();
LABEL_29:
        v16 = (void *)v41;
        -[HFErrorResultComponent setErrorMessageButtonTitle:](v9, "setErrorMessageButtonTitle:", v41);
        goto LABEL_57;
      case 16:
        objc_msgSend(v8, "accessoryNetworkSSID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "length");

        if (!v62)
        {
          v14 = CFSTR("HFSymptomLongDescriptionNetworkProfileFixProblem");
          goto LABEL_50;
        }
        objc_msgSend(v8, "accessoryNetworkSSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionNetworkProfileFixProblemWithName"), CFSTR("%@"), v63, v64, v65, v66, v67, v68, (uint64_t)v16);
LABEL_32:
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v54);
LABEL_33:

        goto LABEL_57;
      case 17:
        objc_msgSend(v8, "accessoryNetworkSSID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "length");

        if (v70)
        {
          objc_msgSend(v8, "accessoryNetworkSSID");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionNetworkProfileInstallProblemWithName"), CFSTR("%@"), v72, v73, v74, v75, v76, v77, (uint64_t)v71);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v78);

        }
        else
        {
          _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomLongDescriptionNetworkProfileInstallProblem"), CFSTR("HFSymptomLongDescriptionNetworkProfileInstallProblem"), 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v71);
        }

        objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnAboutNetworksRequiringProfilesURL");
        v98 = objc_claimAutoreleasedReturnValue();
        goto LABEL_56;
      case 18:
        objc_msgSend(v8, "accessoryNetworkSSID");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "length");

        if (v80)
        {
          objc_msgSend(v8, "accessoryNetworkSSID");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionNetworkNotShareableProblemWithName"), CFSTR("%@"), v82, v83, v84, v85, v86, v87, (uint64_t)v81);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v88);

        }
        else
        {
          _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomLongDescriptionNetworkNotShareableProblem"), CFSTR("HFSymptomLongDescriptionNetworkNotShareableProblem"), 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v81);
        }

        objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnAboutUnshareableNetworksURL");
        v98 = objc_claimAutoreleasedReturnValue();
LABEL_56:
        v99 = (void *)v98;
        -[HFErrorResultComponent setErrorHandlerURL:](v9, "setErrorHandlerURL:", v98);

        _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomDescriptionLearnMore"), CFSTR("HFSymptomDescriptionLearnMore"), 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFErrorResultComponent setErrorHandlerURLText:](v9, "setErrorHandlerURLText:", v16);
        goto LABEL_57;
      case 19:
        objc_msgSend(v8, "currentDeviceNetworkSSID");
        v89 = objc_claimAutoreleasedReturnValue();
        if (v89)
        {
          v90 = (void *)v89;
          objc_msgSend(v8, "accessoryNetworkSSID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v91;
          if (v91)
          {
            v93 = v91;
          }
          else
          {
            objc_msgSend(v8, "currentDeviceNetworkSSID");
            v93 = (id)objc_claimAutoreleasedReturnValue();
          }
          v117 = v93;

          HFLocalizedWiFiString(CFSTR("HFSymptomLongDescriptionProblemNeedCaptiveLeaseRenewal"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v118, CFSTR("%@"), &v132, v117);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v132;
          -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v119);

          objc_msgSend(v8, "accessoryUUID");
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          if (v120)
          {
            objc_msgSend(v8, "accessoryUUID");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            +[HFURLComponents fixSymptomURLForAccessoryWithUUID:symptom:](HFURLComponents, "fixSymptomURLForAccessoryWithUUID:symptom:", v127, v7);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFErrorResultComponent setErrorHandlerURL:](v9, "setErrorHandlerURL:", v128);

          }
          HFLocalizedStringWithFormat(CFSTR("HFSymptomLongDescriptionProblemNeedCaptiveLeaseRenewalLinkString"), CFSTR("%@"), v121, v122, v123, v124, v125, v126, (uint64_t)v117);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFErrorResultComponent setErrorHandlerURLText:](v9, "setErrorHandlerURLText:", v129);

LABEL_86:
          goto LABEL_58;
        }
        HFLogForCategory(0);
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
LABEL_88:
          _os_log_error_impl(&dword_1DD34E000, v97, OS_LOG_TYPE_ERROR, "Skipping WiFi Network Mismatch symptom; We aren't connected to a WiFi network, so that doesn't make any sense.",
            buf,
            2u);
        }
LABEL_76:

        goto LABEL_77;
      default:
        if (v10 == 1000)
        {
          NSLog(CFSTR("symptom.type == HMSymptomTypeFixInProgress! This is disallowed!"));
        }
        else
        {
          if (v10 == 999)
          {
            v14 = CFSTR("HMSymptomLongDescriptionSharedUserErrorNotification");
LABEL_50:
            _HFLocalizedStringWithDefaultValue(v14, v14, 1);
            v31 = objc_claimAutoreleasedReturnValue();
LABEL_51:
            v16 = (void *)v31;
            -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v31);
LABEL_57:

LABEL_58:
            -[HFErrorResultComponent detailedErrorDescription](v9, "detailedErrorDescription");
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            if (v100)
            {
              objc_msgSend(v7, "hf_shortDescription");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              -[HFErrorResultComponent setErrorDescription:](v9, "setErrorDescription:", v101);

            }
            if (objc_msgSend(v8, "fixStateForSymptom:", v7) != 1)
              goto LABEL_72;
            if (objc_msgSend(v7, "type") == 11)
            {
              v102 = CFSTR("HFServiceDescriptionUpdatingNetwork");
            }
            else
            {
              if (objc_msgSend(v7, "type") != 19)
              {
                if (objc_msgSend(v7, "type") == 1 || objc_msgSend(v7, "type") == 2 || objc_msgSend(v7, "type") == 20)
                {
                  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAuthenticatingAccount"), CFSTR("HFServiceDescriptionAuthenticatingAccount"), 1);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v104);

                  -[HFErrorResultComponent setErrorHandlerURL:](v9, "setErrorHandlerURL:", 0);
                  -[HFErrorResultComponent setErrorHandlerURLText:](v9, "setErrorHandlerURLText:", 0);
                }
                -[HFErrorResultComponent setUpdateInProgress:](v9, "setUpdateInProgress:", 1);
                goto LABEL_71;
              }
              v102 = CFSTR("HFServiceDescriptionJoiningCaptive");
            }
            HFLocalizedWiFiString(v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFErrorResultComponent setDetailedErrorDescription:](v9, "setDetailedErrorDescription:", v103);

            -[HFErrorResultComponent setErrorHandlerURL:](v9, "setErrorHandlerURL:", 0);
            -[HFErrorResultComponent setErrorHandlerURLText:](v9, "setErrorHandlerURLText:", 0);
LABEL_71:
            -[HFErrorResultComponent setBadgeType:](v9, "setBadgeType:", 0);
LABEL_72:
            v11 = v9;
            goto LABEL_73;
          }
          HFLogForCategory(0);
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v137 = 0;
            v138 = 2112;
            v139 = v130;
            v140 = 2048;
            v141 = objc_msgSend(v7, "type");
            _os_log_error_impl(&dword_1DD34E000, v94, OS_LOG_TYPE_ERROR, "%@:%@ Unhandled symptom type: %ld", buf, 0x20u);

          }
        }
LABEL_77:
        v11 = 0;
LABEL_73:

        break;
    }
  }

  return v11;
}

+ (int64_t)_displayPriorityForSymptom:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  if ((unint64_t)(v3 - 1) > 0x13)
    return 0;
  else
    return qword_1DD669BA8[v3 - 1];
}

+ (BOOL)_requiresManualFixOptionToDisplaySymptom:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "type");
  return (v3 < 0x15) & (0x10200Eu >> v3);
}

- (void)_addAccountSymptomMessageForAccountName:(id)a3 symptom:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  HFErrorResultComponent *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(a3, "length");
  v9 = objc_msgSend(v7, "type");
  if (v9 != 20)
  {
    if (v9 == 2)
    {
      if (v8)
      {
        v10 = CFSTR("HFAppleMusicAccountIncorrectCredentials");
        goto LABEL_8;
      }
      v14 = CFSTR("HFAppleMusicAccountNoCredentials");
      goto LABEL_15;
    }
    if (v9 != 1)
    {
      HFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = self;
        v20 = 2112;
        v21 = v17;
        v22 = 2048;
        v23 = objc_msgSend(v7, "type");
        _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Unhandled symptom type: %ld", (uint8_t *)&v18, 0x20u);

      }
      if (v8)
        goto LABEL_12;
LABEL_16:
      v13 = CFSTR("HFAppleMusicSignIn");
      goto LABEL_17;
    }
  }
  if (!v8)
  {
    v14 = CFSTR("HFAppleiCloudAccountNoCredentials");
LABEL_15:
    _HFLocalizedStringWithDefaultValue(v14, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFErrorResultComponent setErrorMessageTitle:](self, "setErrorMessageTitle:", v15);

    goto LABEL_16;
  }
  v10 = CFSTR("HFAppleiCloudAccountIncorrectCredentials");
LABEL_8:
  _HFLocalizedStringWithDefaultValue(v10, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFErrorResultComponent setErrorMessageTitle:](self, "setErrorMessageTitle:", v11);

LABEL_12:
  v13 = CFSTR("HFEnterPassword");
LABEL_17:
  _HFLocalizedStringWithDefaultValue(v13, v13, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFErrorResultComponent setErrorMessageButtonTitle:](self, "setErrorMessageButtonTitle:", v16);

}

@end
