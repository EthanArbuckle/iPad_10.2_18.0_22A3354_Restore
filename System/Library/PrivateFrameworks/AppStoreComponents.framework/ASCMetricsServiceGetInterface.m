@implementation ASCMetricsServiceGetInterface

void __ASCMetricsServiceGetInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4CF630);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCMetricsServiceGetInterface_interface;
  ASCMetricsServiceGetInterface_interface = v0;

  v2 = (void *)ASCMetricsServiceGetInterface_interface;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_processMetricsData_pageFields_activity_withReplyHandler_, 0, 0);

  v4 = (void *)ASCMetricsServiceGetInterface_interface;
  ASCMetricsFieldsGetCodableClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_processMetricsData_pageFields_activity_withReplyHandler_, 1, 0);

  v6 = (void *)ASCMetricsServiceGetInterface_interface;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_processMetricsData_pageFields_activity_withReplyHandler_, 2, 0);

  v8 = (void *)ASCMetricsServiceGetInterface_interface;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_processMetricsData_pageFields_activity_withReplyHandler_, 0, 1);

  v10 = (void *)ASCMetricsServiceGetInterface_interface;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_processViewRenderWithPredicate_withReplyHandler_, 0, 0);

  v12 = (void *)ASCMetricsServiceGetInterface_interface;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_processViewRenderWithPredicate_withReplyHandler_, 0, 1);

  v14 = (void *)ASCMetricsServiceGetInterface_interface;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_, 0, 0);

  v16 = (void *)ASCMetricsServiceGetInterface_interface;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_, 1, 0);

  v18 = (void *)ASCMetricsServiceGetInterface_interface;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_, 2, 0);

  v20 = (void *)ASCMetricsServiceGetInterface_interface;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_, 3, 0);

  v22 = (void *)ASCMetricsServiceGetInterface_interface;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_recordQToken_campaignToken_advertisementID_withLockup_withReplyHandler_, 0, 1);

  ASCMetricsFieldsGetCodableClasses();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setByAddingObjectsFromArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)ASCMetricsServiceGetInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_logErrorMessage_, 0, 0);
}

@end
