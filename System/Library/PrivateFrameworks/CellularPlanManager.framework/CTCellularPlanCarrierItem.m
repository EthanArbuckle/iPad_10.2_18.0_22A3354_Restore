@implementation CTCellularPlanCarrierItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanCarrierItem)initWithName:(id)a3 plan:(id)a4 url:(id)a5 applePaySupported:(BOOL)a6 responseType:(id)a7 warningText:(id)a8 purchaseOption:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CTCellularPlanCarrierItem *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *websheetURL;
  uint64_t v26;
  NSString *planPurchaseEndpointType;
  uint64_t v28;
  NSString *warningText;
  uint64_t v30;
  NSString *purchaseOption;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)CTCellularPlanCarrierItem;
  v21 = -[CTCellularPlanCarrierItem init](&v33, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v22;

    objc_storeStrong((id *)&v21->_plan, a4);
    v24 = objc_msgSend(v17, "copy");
    websheetURL = v21->_websheetURL;
    v21->_websheetURL = (NSString *)v24;

    v21->_applePaySupported = a6;
    v26 = objc_msgSend(v18, "copy");
    planPurchaseEndpointType = v21->_planPurchaseEndpointType;
    v21->_planPurchaseEndpointType = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    warningText = v21->_warningText;
    v21->_warningText = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    purchaseOption = v21->_purchaseOption;
    v21->_purchaseOption = (NSString *)v30;

  }
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  CTPlan *plan;
  void *v7;
  _BOOL8 applePaySupported;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSString copy](self->_name, "copy");
  plan = self->_plan;
  v7 = (void *)-[NSString copy](self->_websheetURL, "copy");
  applePaySupported = self->_applePaySupported;
  v9 = (void *)-[NSString copy](self->_planPurchaseEndpointType, "copy");
  v10 = (void *)-[NSString copy](self->_warningText, "copy");
  v11 = (void *)-[NSString copy](self->_purchaseOption, "copy");
  v12 = (void *)objc_msgSend(v4, "initWithName:plan:url:applePaySupported:responseType:warningText:purchaseOption:", v5, plan, v7, applePaySupported, v9, v10, v11);

  return v12;
}

- (CTCellularPlanCarrierItem)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanCarrierItem *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  CTPlan *plan;
  uint64_t v10;
  NSString *websheetURL;
  uint64_t v12;
  NSString *planPurchaseEndpointType;
  uint64_t v14;
  NSString *warningText;
  uint64_t v16;
  NSString *purchaseOption;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCellularPlanCarrierItem;
  v5 = -[CTCellularPlanCarrierItem init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plan"));
    v8 = objc_claimAutoreleasedReturnValue();
    plan = v5->_plan;
    v5->_plan = (CTPlan *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("websheetUrl"));
    v10 = objc_claimAutoreleasedReturnValue();
    websheetURL = v5->_websheetURL;
    v5->_websheetURL = (NSString *)v10;

    v5->_applePaySupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("applePay"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseType"));
    v12 = objc_claimAutoreleasedReturnValue();
    planPurchaseEndpointType = v5->_planPurchaseEndpointType;
    v5->_planPurchaseEndpointType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("warningText"));
    v14 = objc_claimAutoreleasedReturnValue();
    warningText = v5->_warningText;
    v5->_warningText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseOption"));
    v16 = objc_claimAutoreleasedReturnValue();
    purchaseOption = v5->_purchaseOption;
    v5->_purchaseOption = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("carrierName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_plan, CFSTR("plan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_websheetURL, CFSTR("websheetUrl"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_applePaySupported, CFSTR("applePay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planPurchaseEndpointType, CFSTR("responseType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_warningText, CFSTR("warningText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseOption, CFSTR("purchaseOption"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Carrier Name: %@ plan: %@ ApplePay: %d warningText: %@ purchaseOption: %@>"), v5, self, self->_name, self->_plan, self->_applePaySupported, self->_warningText, self->_purchaseOption);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (CTPlan)plan
{
  return self->_plan;
}

- (NSString)websheetURL
{
  return self->_websheetURL;
}

- (BOOL)applePaySupported
{
  return self->_applePaySupported;
}

- (NSString)planPurchaseEndpointType
{
  return self->_planPurchaseEndpointType;
}

- (NSString)warningText
{
  return self->_warningText;
}

- (NSString)purchaseOption
{
  return self->_purchaseOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_purchaseOption, 0);
  objc_storeStrong((id *)&self->_addOnEndpointType, 0);
  objc_storeStrong((id *)&self->_addOnWebsheetURL, 0);
  objc_storeStrong((id *)&self->_warningText, 0);
  objc_storeStrong((id *)&self->_planPurchaseEndpointType, 0);
  objc_storeStrong((id *)&self->_websheetURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
