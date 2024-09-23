@implementation NSXPCInterface(Entity)

- (uint64_t)ln_updateWithEntityInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchValueForPropertyWithIdentifier_entity_completionHandler_, 0, 1);
  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchValueForPropertyWithIdentifier_entity_completionHandler_, 1, 1);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_updateProperties_withQuery_completionHandler_, 0, 0);

  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateProperties_withQuery_completionHandler_, 1, 0);
  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_updateProperties_withQuery_completionHandler_, 0, 1);
  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchEntityURL_completionHandler_, 0, 1);
  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fetchEntityURL_completionHandler_, 1, 1);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_exportTransientEntities_withConfiguration_completionHandler_, 0, 0);

  objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_exportTransientEntities_withConfiguration_completionHandler_, 0, 1);
  return objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_exportTransientEntities_withConfiguration_completionHandler_, 1, 1);
}

@end
