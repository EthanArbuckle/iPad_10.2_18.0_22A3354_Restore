@implementation CTCellularPlanManagerCameraScanAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanManagerCameraScanAction message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", message=%@"), v4);

  -[CTCellularPlanManagerCameraScanAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", title=%@"), v5);

  -[CTCellularPlanManagerCameraScanAction smdpAddress](self, "smdpAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", smdpAddress=%@"), v6);

  -[CTCellularPlanManagerCameraScanAction matchingId](self, "matchingId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", matchingId=%@"), v7);

  -[CTCellularPlanManagerCameraScanAction OID](self, "OID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", oid=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CAMERA"), &stru_1E1536FB8, CFSTR("CBMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanManagerCameraScanAction performWithAppName:completionHandler:](self, "performWithAppName:completionHandler:", v6, v5);

}

- (void)performWithAppName:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  CoreTelephonyClient *v8;
  CTCellularPlanProvisioningRequest *v9;
  CoreTelephonyClient *v10;

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  v8 = [CoreTelephonyClient alloc];
  v10 = -[CoreTelephonyClient initWithQueue:](v8, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v9 = objc_alloc_init(CTCellularPlanProvisioningRequest);
  -[CTCellularPlanProvisioningRequest setAddress:](v9, "setAddress:", self->_smdpAddress);
  -[CTCellularPlanProvisioningRequest setMatchingID:](v9, "setMatchingID:", self->_matchingId);
  -[CTCellularPlanProvisioningRequest setOID:](v9, "setOID:", self->_OID);
  -[CoreTelephonyClient addPlanWith:appName:appType:completionHandler:](v10, "addPlanWith:appName:appType:completionHandler:", v9, v7, 1, &__block_literal_global_3);

  v6[2](v6, 0);
}

void __78__CTCellularPlanManagerCameraScanAction_performWithAppName_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((unint64_t)(a2 - 1) > 2)
    NSLog(CFSTR("Recieved callback for public add plan - results UNKNOWN"));
  else
    NSLog(*((NSString **)&off_1E152FF50 + a2 - 1));

}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCellularPlanManagerCameraScanAction message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMessage:", v6);

  -[CTCellularPlanManagerCameraScanAction title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTitle:", v8);

  -[CTCellularPlanManagerCameraScanAction smdpAddress](self, "smdpAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSmdpAddress:", v10);

  -[CTCellularPlanManagerCameraScanAction matchingId](self, "matchingId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setMatchingId:", v12);

  -[CTCellularPlanManagerCameraScanAction OID](self, "OID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setOID:", v14);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CTCellularPlanManagerCameraScanAction message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("message"));

  -[CTCellularPlanManagerCameraScanAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[CTCellularPlanManagerCameraScanAction smdpAddress](self, "smdpAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("smdpaddress"));

  -[CTCellularPlanManagerCameraScanAction matchingId](self, "matchingId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("matchingid"));

  -[CTCellularPlanManagerCameraScanAction OID](self, "OID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("oid"));

}

- (CTCellularPlanManagerCameraScanAction)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanManagerCameraScanAction *v5;
  uint64_t v6;
  NSString *message;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *smdpAddress;
  uint64_t v12;
  NSString *matchingId;
  uint64_t v14;
  NSString *OID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTCellularPlanManagerCameraScanAction;
  v5 = -[CTCellularPlanManagerCameraScanAction init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smdpaddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    smdpAddress = v5->_smdpAddress;
    v5->_smdpAddress = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchingid"));
    v12 = objc_claimAutoreleasedReturnValue();
    matchingId = v5->_matchingId;
    v5->_matchingId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oid"));
    v14 = objc_claimAutoreleasedReturnValue();
    OID = v5->_OID;
    v5->_OID = (NSString *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)smdpAddress
{
  return self->_smdpAddress;
}

- (void)setSmdpAddress:(id)a3
{
  objc_storeStrong((id *)&self->_smdpAddress, a3);
}

- (NSString)matchingId
{
  return self->_matchingId;
}

- (void)setMatchingId:(id)a3
{
  objc_storeStrong((id *)&self->_matchingId, a3);
}

- (NSString)OID
{
  return self->_OID;
}

- (void)setOID:(id)a3
{
  objc_storeStrong((id *)&self->_OID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OID, 0);
  objc_storeStrong((id *)&self->_matchingId, 0);
  objc_storeStrong((id *)&self->_smdpAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
