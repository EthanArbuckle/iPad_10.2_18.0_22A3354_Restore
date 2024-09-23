@implementation NPKRemotePassActionSelectItemRequest

- (NPKRemotePassActionSelectItemRequest)initWithPass:(id)a3 image:(id)a4 commutePlanField:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NPKRemotePassActionSelectItemRequest *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  id v51;

  v7 = a3;
  v51 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  PKPaymentPassActionTypeToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@:%@"), v10, v12, v14);
  v50 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REQUEST_REMOTE_PAYMENT_PASS_ACTION_RENEW_CAPTION"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v17, v18);
  v48 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedDescription");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v19;
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("REQUEST_REMOTE_PAYMENT_PASS_ACTION_RENEW_SUMMARY_TEXT"), &stru_24CFF06D8, CFSTR("NanoPassKit-RemotePaymentPassAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringWithFormat:", v23, v22);
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "remoteContentConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(MEMORY[0x24BE6EDB0], "sharedService");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "context");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "deviceID");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v47 = NPKRemotePassActionCardTypeForPass(v7);
  objc_msgSend(v7, "organizationName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v7, "passTypeIdentifier");
    v29 = v27;
    v44 = (void *)v27;
    v30 = v7;
    v31 = v22;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "serialNumber");
    v33 = v8;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v24;
    v43 = (void *)v24;
    v35 = (void *)v48;
    v36 = v51;
    v37 = (void *)v50;
    v38 = -[NPKRemotePassActionSelectItemRequest initWithIdentifier:deviceIdentifier:cardType:passOrganizationName:passTypeIdentifier:passSerialNumber:commutePlanField:image:passLocalizedDesciption:caption:summaryText:](self, "initWithIdentifier:deviceIdentifier:cardType:passOrganizationName:passTypeIdentifier:passSerialNumber:commutePlanField:image:passLocalizedDesciption:caption:summaryText:", v50, v29, v47, v28, v32, v34, v33, v51, v31, v48, v41);

    v8 = v33;
    v39 = v43;

    v22 = v31;
    v7 = v30;

    v28 = v46;
  }
  else
  {
    v42 = v24;
    v39 = (void *)v24;
    v35 = (void *)v48;
    v36 = v51;
    v37 = (void *)v50;
    v38 = -[NPKRemotePassActionSelectItemRequest initWithIdentifier:deviceIdentifier:cardType:passOrganizationName:passTypeIdentifier:passSerialNumber:commutePlanField:image:passLocalizedDesciption:caption:summaryText:](self, "initWithIdentifier:deviceIdentifier:cardType:passOrganizationName:passTypeIdentifier:passSerialNumber:commutePlanField:image:passLocalizedDesciption:caption:summaryText:", v50, v27, v47, v28, 0, 0, v8, v51, v22, v48, v42);
  }

  return v38;
}

- (NPKRemotePassActionSelectItemRequest)initWithIdentifier:(id)a3 deviceIdentifier:(id)a4 cardType:(unint64_t)a5 passOrganizationName:(id)a6 passTypeIdentifier:(id)a7 passSerialNumber:(id)a8 commutePlanField:(id)a9 image:(id)a10 passLocalizedDesciption:(id)a11 caption:(id)a12 summaryText:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NPKProtoRemotePassActionEnvelope *v25;
  NPKProtoRemotePassActionSelectItemRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NPKRemotePassActionSelectItemRequest *v39;
  id v43;
  id v44;
  objc_super v46;

  v17 = a13;
  v18 = a12;
  v19 = a11;
  v44 = a10;
  v20 = a9;
  v43 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(NPKProtoRemotePassActionEnvelope);
  -[NPKProtoRemotePassActionEnvelope setVersion:](v25, "setVersion:", 2);
  -[NPKProtoRemotePassActionEnvelope setIsResponse:](v25, "setIsResponse:", 0);
  -[NPKProtoRemotePassActionEnvelope setMessageType:](v25, "setMessageType:", 2);
  -[NPKProtoRemotePassActionEnvelope setPassLocalizedDescription:](v25, "setPassLocalizedDescription:", v19);

  -[NPKProtoRemotePassActionEnvelope setCaption:](v25, "setCaption:", v18);
  -[NPKProtoRemotePassActionEnvelope setSummaryText:](v25, "setSummaryText:", v17);

  -[NPKProtoRemotePassActionEnvelope setPassOrganizationName:](v25, "setPassOrganizationName:", v22);
  -[NPKProtoRemotePassActionEnvelope setCardType:](v25, "setCardType:", NPKProtoRemotePassActionCardTypeForNPKRemotePassActionCardType(a5));
  v26 = objc_alloc_init(NPKProtoRemotePassActionSelectItemRequest);
  objc_msgSend(v20, "action");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NPKSecureArchiveObject(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest setPaymentPassActionData:](v26, "setPaymentPassActionData:", v28);

  objc_msgSend(v20, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest setPlanIdentifier:](v26, "setPlanIdentifier:", v29);

  objc_msgSend(v20, "label");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest setPlanLabel:](v26, "setPlanLabel:", v30);

  objc_msgSend(v20, "detailLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest setPlanDetailLabel:](v26, "setPlanDetailLabel:", v31);

  objc_msgSend(v20, "usageDateRange");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NPKSecureArchiveObject(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest setStartDateData:](v26, "setStartDateData:", v34);

  objc_msgSend(v20, "usageDateRange");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "expiryDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  NPKSecureArchiveObject(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest setExpiryDateData:](v26, "setExpiryDateData:", v37);

  -[NPKProtoRemotePassActionSelectItemRequest setRequestUniqueID:](v26, "setRequestUniqueID:", v24);
  -[NPKProtoRemotePassActionSelectItemRequest setDeviceIdentifier:](v26, "setDeviceIdentifier:", v23);

  -[NPKProtoRemotePassActionSelectItemRequest setPassTypeIdentifier:](v26, "setPassTypeIdentifier:", v21);
  -[NPKProtoRemotePassActionSelectItemRequest setPassSerialNumber:](v26, "setPassSerialNumber:", v43);

  -[NPKProtoRemotePassActionSelectItemRequest data](v26, "data");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnvelope setMessageProtoData:](v25, "setMessageProtoData:", v38);
  v46.receiver = self;
  v46.super_class = (Class)NPKRemotePassActionSelectItemRequest;
  v39 = -[NPKRemotePassAction initWithProtoEnvelope:image:](&v46, sel_initWithProtoEnvelope_image_, v25, v44);

  return v39;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionSelectItemRequest;
  -[NPKRemotePassActionRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionSelectItemRequest commutePlanField](self, "commutePlanField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (commutePlanField:%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionSelectItemRequest protoRequest](self, "protoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)action
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionSelectItemRequest commutePlanField](self, "commutePlanField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)actionText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[NPKRemotePassActionSelectItemRequest action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confirmationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NPKRemotePassActionSelectItemRequest;
    -[NPKRemotePassActionRequest actionText](&v9, sel_actionText);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (NPKProtoRemotePassActionSelectItemRequest)protoRequest
{
  NPKProtoRemotePassActionSelectItemRequest *protoRequest;
  NPKProtoRemotePassActionSelectItemRequest *v4;
  void *v5;
  void *v6;
  NPKProtoRemotePassActionSelectItemRequest *v7;
  NPKProtoRemotePassActionSelectItemRequest *v8;

  protoRequest = self->_protoRequest;
  if (!protoRequest)
  {
    v4 = [NPKProtoRemotePassActionSelectItemRequest alloc];
    -[NPKRemotePassAction protoEnvelope](self, "protoEnvelope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageProtoData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NPKProtoRemotePassActionSelectItemRequest initWithData:](v4, "initWithData:", v6);
    v8 = self->_protoRequest;
    self->_protoRequest = v7;

    protoRequest = self->_protoRequest;
  }
  return protoRequest;
}

- (NPKCommutePlanField)commutePlanField
{
  NPKCommutePlanField *cachedCommutePlanField;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NPKDateRange *v14;
  NPKCommutePlanField *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NPKCommutePlanField *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  NPKCommutePlanField *v28;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  cachedCommutePlanField = self->_cachedCommutePlanField;
  if (!cachedCommutePlanField)
  {
    -[NPKRemotePassActionSelectItemRequest protoRequest](self, "protoRequest");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "paymentPassActionData");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = objc_opt_class();
        NPKSecureUnarchiveObject(v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v5, "startDateData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_opt_class();
          NPKSecureUnarchiveObject(v10, v11);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "expiryDateData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_opt_class();
          NPKSecureUnarchiveObject(v12, v13);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v6;
          v14 = -[NPKDateRange initWithStartDate:expirationDate:formatterStyle:]([NPKDateRange alloc], "initWithStartDate:expirationDate:formatterStyle:", v33, v32, 3);
          v15 = [NPKCommutePlanField alloc];
          objc_msgSend(v5, "planLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "planDetailLabel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "planIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject associatedPlan](v9, "associatedPlan");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v30) = objc_msgSend(v19, "isDeviceBound");
          v20 = -[NPKCommutePlanField initWithLabel:detailLabel:formattedValue:rawCountValue:usageDateRange:identifier:details:action:isDeviceBound:pendingUpdateExpireDate:](v15, "initWithLabel:detailLabel:formattedValue:rawCountValue:usageDateRange:identifier:details:action:isDeviceBound:pendingUpdateExpireDate:", v16, v17, 0, 0, v14, v18, 0, v9, v30, 0);

          v6 = v31;
LABEL_19:

LABEL_22:
          goto LABEL_23;
        }
        pk_RemotePassAction_log();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v26)
        {
          pk_RemotePassAction_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v34 = 0;
            _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_ERROR, "Error: Missing Action", v34, 2u);
          }

        }
        v9 = 0;
LABEL_18:
        v20 = 0;
        goto LABEL_19;
      }
      pk_RemotePassAction_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        pk_RemotePassAction_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Missing action data", v35, 2u);
        }
        goto LABEL_18;
      }
      v6 = 0;
    }
    else
    {
      pk_RemotePassAction_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
        v20 = 0;
LABEL_23:

        v28 = self->_cachedCommutePlanField;
        self->_cachedCommutePlanField = v20;

        cachedCommutePlanField = self->_cachedCommutePlanField;
        return cachedCommutePlanField;
      }
      pk_RemotePassAction_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Missing proto request", buf, 2u);
      }
    }
    v20 = 0;
    goto LABEL_22;
  }
  return cachedCommutePlanField;
}

- (NSString)deviceIdentifier
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionSelectItemRequest protoRequest](self, "protoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)passTypeIdentifier
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionSelectItemRequest protoRequest](self, "protoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)passSerialNumber
{
  void *v2;
  void *v3;

  -[NPKRemotePassActionSelectItemRequest protoRequest](self, "protoRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passSerialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setProtoRequest:(id)a3
{
  objc_storeStrong((id *)&self->_protoRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoRequest, 0);
  objc_storeStrong((id *)&self->_cachedCommutePlanField, 0);
}

@end
