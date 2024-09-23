@implementation AAFTapToRadarRequest

- (id)formattedKeywords
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  -[AAFTapToRadarRequest keywords](self, "keywords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AAFTapToRadarRequest keywords](self, "keywords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E9947678;
  }
  return v6;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)alertDefaultButtonText
{
  return self->_alertDefaultButtonText;
}

- (void)setAlertDefaultButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)alertCancelButtonText
{
  return self->_alertCancelButtonText;
}

- (void)setAlertCancelButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)alertOtherButtonText
{
  return self->_alertOtherButtonText;
}

- (void)setAlertOtherButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)alertOtherButtonAction
{
  return self->_alertOtherButtonAction;
}

- (void)setAlertOtherButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_keywords, a3);
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)fullDiagnostic
{
  return self->_fullDiagnostic;
}

- (void)setFullDiagnostic:(BOOL)a3
{
  self->_fullDiagnostic = a3;
}

- (NSArray)keywordIDs
{
  return self->_keywordIDs;
}

- (void)setKeywordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_keywordIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordIDs, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong(&self->_alertOtherButtonAction, 0);
  objc_storeStrong((id *)&self->_alertOtherButtonText, 0);
  objc_storeStrong((id *)&self->_alertCancelButtonText, 0);
  objc_storeStrong((id *)&self->_alertDefaultButtonText, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end
