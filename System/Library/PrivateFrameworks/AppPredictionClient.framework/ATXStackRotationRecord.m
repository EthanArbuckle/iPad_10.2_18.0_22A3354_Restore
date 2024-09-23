@implementation ATXStackRotationRecord

- (ATXStackRotationRecord)initWithInfoSuggestionId:(id)a3 clientModelId:(id)a4 criterion:(id)a5 widget:(id)a6 kind:(id)a7 intent:(id)a8 isStalenessRotation:(BOOL)a9 rotationDate:(id)a10 durationLimit:(double)a11 coolDownInterval:(double)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  ATXStackRotationRecord *v26;
  uint64_t v27;
  NSString *infoSuggestionId;
  uint64_t v29;
  NSString *clientModelId;
  uint64_t v31;
  NSString *criterion;
  uint64_t v33;
  NSString *extensionBundleId;
  uint64_t v35;
  NSString *widgetKind;
  id v38;
  objc_super v39;

  v38 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a10;
  v39.receiver = self;
  v39.super_class = (Class)ATXStackRotationRecord;
  v26 = -[ATXStackRotationRecord init](&v39, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v38, "copy");
    infoSuggestionId = v26->_infoSuggestionId;
    v26->_infoSuggestionId = (NSString *)v27;

    v29 = objc_msgSend(v20, "copy");
    clientModelId = v26->_clientModelId;
    v26->_clientModelId = (NSString *)v29;

    v31 = objc_msgSend(v21, "copy");
    criterion = v26->_criterion;
    v26->_criterion = (NSString *)v31;

    v33 = objc_msgSend(v22, "copy");
    extensionBundleId = v26->_extensionBundleId;
    v26->_extensionBundleId = (NSString *)v33;

    v35 = objc_msgSend(v23, "copy");
    widgetKind = v26->_widgetKind;
    v26->_widgetKind = (NSString *)v35;

    objc_storeStrong((id *)&v26->_intent, a8);
    v26->_isStalenessRotation = a9;
    objc_storeStrong((id *)&v26->_rotationDate, a10);
    v26->_durationLimit = a11;
    v26->_coolDownInterval = a12;
  }

  return v26;
}

- (NSString)infoSuggestionId
{
  return self->_infoSuggestionId;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (INIntent)intent
{
  return self->_intent;
}

- (BOOL)isStalenessRotation
{
  return self->_isStalenessRotation;
}

- (NSDate)rotationDate
{
  return self->_rotationDate;
}

- (double)durationLimit
{
  return self->_durationLimit;
}

- (double)coolDownInterval
{
  return self->_coolDownInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationDate, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_infoSuggestionId, 0);
}

@end
