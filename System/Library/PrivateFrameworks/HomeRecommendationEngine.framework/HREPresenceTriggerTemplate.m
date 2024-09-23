@implementation HREPresenceTriggerTemplate

- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  id v5;
  HRERecommendationEmptyTriggerBuilderContext *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  v7 = objc_alloc(MEMORY[0x24BE4D090]);
  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithHome:context:", v8, v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD78E0]), "initWithPresenceEventType:presenceUserType:", -[HREPresenceTriggerTemplate presenceType](self, "presenceType"), -[HREPresenceTriggerTemplate presenceUserType](self, "presenceUserType"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4D130]), "initWithEvent:", v10);
  objc_msgSend(v9, "locationInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocationEventBuilder:", v11);

  return v9;
}

- (unint64_t)presenceType
{
  return self->_presenceType;
}

- (void)setPresenceType:(unint64_t)a3
{
  self->_presenceType = a3;
}

- (unint64_t)presenceUserType
{
  return self->_presenceUserType;
}

- (void)setPresenceUserType:(unint64_t)a3
{
  self->_presenceUserType = a3;
}

@end
