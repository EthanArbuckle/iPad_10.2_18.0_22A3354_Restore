@implementation CLKComplicationClientInterface

void __CLKComplicationClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC5A40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKComplicationClientInterface_interface;
  CLKComplicationClientInterface_interface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CLKComplicationClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_setActiveComplications_, 0, 0);
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CLKComplicationClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getTimelineEntriesForComplication_afterDate_limit_withHandler_, 0, 1);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CLKComplicationClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getComplicationDescriptorsWithHandler_, 0, 1);
  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CLKComplicationClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_handleSharedComplicationDescriptors_, 0, 0);
  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CLKComplicationClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getWidgetMigrationConfigurationFrom_withHandler_, 0, 1);

}

@end
