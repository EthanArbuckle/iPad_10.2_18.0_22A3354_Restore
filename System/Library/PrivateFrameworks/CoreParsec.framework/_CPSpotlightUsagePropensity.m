@implementation _CPSpotlightUsagePropensity

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPSpotlightUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  -[_CPSpotlightUsagePropensity appLaunch](self, "appLaunch");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity onDeviceAddressBookData](self, "onDeviceAddressBookData");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity onDeviceOtherPersonalData](self, "onDeviceOtherPersonalData");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity punchout](self, "punchout");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity thirdPartyInAppContent](self, "thirdPartyInAppContent");
  if (v8 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsec](self, "parsec");
  if (v9 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity querySuggestion](self, "querySuggestion");
  if (v10 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity other](self, "other");
  if (v11 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPSpotlightUsagePropensity totalEngagements](self, "totalEngagements"))
    PBDataWriterWriteInt32Field();
  -[_CPSpotlightUsagePropensity siriSuggestions](self, "siriSuggestions");
  if (v12 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecWeb](self, "parsecWeb");
  if (v13 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecAppStore](self, "parsecAppStore");
  if (v14 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecMaps](self, "parsecMaps");
  if (v15 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecWiki](self, "parsecWiki");
  if (v16 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecNews](self, "parsecNews");
  if (v17 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecStocks](self, "parsecStocks");
  if (v18 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecWeather](self, "parsecWeather");
  if (v19 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity parsecOther](self, "parsecOther");
  if (v20 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity webSuggestions](self, "webSuggestions");
  if (v21 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSpotlightUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_CPSpotlightUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_CPSpotlightUsagePropensity querySuggestionTriggerRatio](self, "querySuggestionTriggerRatio");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_CPSpotlightUsagePropensity querySuggestionTriggerRatio](self, "querySuggestionTriggerRatio");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSpotlightUsagePropensity totalTopHitEngagements](self, "totalTopHitEngagements"))
    PBDataWriterWriteInt32Field();
  -[_CPSpotlightUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_CPSpotlightUsagePropensity engagementShareRatio](self, "engagementShareRatio");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float appLaunch;
  float v6;
  float onDeviceAddressBookData;
  float v8;
  float onDeviceOtherPersonalData;
  float v10;
  float punchout;
  float v12;
  float thirdPartyInAppContent;
  float v14;
  float parsec;
  float v16;
  float querySuggestion;
  float v18;
  float other;
  float v20;
  int totalEngagements;
  float siriSuggestions;
  float v23;
  float parsecWeb;
  float v25;
  float parsecAppStore;
  float v27;
  float parsecMaps;
  float v29;
  float parsecWiki;
  float v31;
  float parsecNews;
  float v33;
  float parsecStocks;
  float v35;
  float parsecWeather;
  float v37;
  float parsecOther;
  float v39;
  float webSuggestions;
  float v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  int totalTopHitEngagements;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  BOOL v60;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  appLaunch = self->_appLaunch;
  objc_msgSend(v4, "appLaunch");
  if (appLaunch != v6)
    goto LABEL_37;
  onDeviceAddressBookData = self->_onDeviceAddressBookData;
  objc_msgSend(v4, "onDeviceAddressBookData");
  if (onDeviceAddressBookData != v8)
    goto LABEL_37;
  onDeviceOtherPersonalData = self->_onDeviceOtherPersonalData;
  objc_msgSend(v4, "onDeviceOtherPersonalData");
  if (onDeviceOtherPersonalData != v10)
    goto LABEL_37;
  punchout = self->_punchout;
  objc_msgSend(v4, "punchout");
  if (punchout != v12)
    goto LABEL_37;
  thirdPartyInAppContent = self->_thirdPartyInAppContent;
  objc_msgSend(v4, "thirdPartyInAppContent");
  if (thirdPartyInAppContent != v14)
    goto LABEL_37;
  parsec = self->_parsec;
  objc_msgSend(v4, "parsec");
  if (parsec != v16)
    goto LABEL_37;
  querySuggestion = self->_querySuggestion;
  objc_msgSend(v4, "querySuggestion");
  if (querySuggestion != v18)
    goto LABEL_37;
  other = self->_other;
  objc_msgSend(v4, "other");
  if (other != v20)
    goto LABEL_37;
  totalEngagements = self->_totalEngagements;
  if (totalEngagements != objc_msgSend(v4, "totalEngagements"))
    goto LABEL_37;
  siriSuggestions = self->_siriSuggestions;
  objc_msgSend(v4, "siriSuggestions");
  if (siriSuggestions != v23)
    goto LABEL_37;
  parsecWeb = self->_parsecWeb;
  objc_msgSend(v4, "parsecWeb");
  if (parsecWeb != v25)
    goto LABEL_37;
  parsecAppStore = self->_parsecAppStore;
  objc_msgSend(v4, "parsecAppStore");
  if (parsecAppStore != v27)
    goto LABEL_37;
  parsecMaps = self->_parsecMaps;
  objc_msgSend(v4, "parsecMaps");
  if (parsecMaps != v29)
    goto LABEL_37;
  parsecWiki = self->_parsecWiki;
  objc_msgSend(v4, "parsecWiki");
  if (parsecWiki != v31)
    goto LABEL_37;
  parsecNews = self->_parsecNews;
  objc_msgSend(v4, "parsecNews");
  if (parsecNews != v33)
    goto LABEL_37;
  parsecStocks = self->_parsecStocks;
  objc_msgSend(v4, "parsecStocks");
  if (parsecStocks != v35)
    goto LABEL_37;
  parsecWeather = self->_parsecWeather;
  objc_msgSend(v4, "parsecWeather");
  if (parsecWeather != v37)
    goto LABEL_37;
  parsecOther = self->_parsecOther;
  objc_msgSend(v4, "parsecOther");
  if (parsecOther != v39)
    goto LABEL_37;
  webSuggestions = self->_webSuggestions;
  objc_msgSend(v4, "webSuggestions");
  if (webSuggestions != v41)
    goto LABEL_37;
  -[_CPSpotlightUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topHitTriggerRatio");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v42 == 0) == (v43 != 0))
    goto LABEL_36;
  -[_CPSpotlightUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_CPSpotlightUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topHitTriggerRatio");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_37;
  }
  else
  {

  }
  -[_CPSpotlightUsagePropensity querySuggestionTriggerRatio](self, "querySuggestionTriggerRatio");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "querySuggestionTriggerRatio");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v42 == 0) == (v43 != 0))
    goto LABEL_36;
  -[_CPSpotlightUsagePropensity querySuggestionTriggerRatio](self, "querySuggestionTriggerRatio");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_CPSpotlightUsagePropensity querySuggestionTriggerRatio](self, "querySuggestionTriggerRatio");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "querySuggestionTriggerRatio");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_37;
  }
  else
  {

  }
  totalTopHitEngagements = self->_totalTopHitEngagements;
  if (totalTopHitEngagements != objc_msgSend(v4, "totalTopHitEngagements"))
    goto LABEL_37;
  -[_CPSpotlightUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementShareRatio");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v42 == 0) == (v43 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  -[_CPSpotlightUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v55 = objc_claimAutoreleasedReturnValue();
  if (!v55)
  {

LABEL_40:
    v60 = 1;
    goto LABEL_38;
  }
  v56 = (void *)v55;
  -[_CPSpotlightUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementShareRatio");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v57, "isEqual:", v58);

  if ((v59 & 1) != 0)
    goto LABEL_40;
LABEL_37:
  v60 = 0;
LABEL_38:

  return v60;
}

- (unint64_t)hash
{
  float appLaunch;
  double v4;
  long double v5;
  unint64_t v6;
  float onDeviceAddressBookData;
  double v8;
  long double v9;
  unint64_t v10;
  float onDeviceOtherPersonalData;
  double v12;
  long double v13;
  unint64_t v14;
  float punchout;
  double v16;
  long double v17;
  float thirdPartyInAppContent;
  double v19;
  long double v20;
  unint64_t v21;
  float parsec;
  double v23;
  long double v24;
  float querySuggestion;
  double v26;
  long double v27;
  float other;
  double v29;
  long double v30;
  float siriSuggestions;
  double v32;
  long double v33;
  float parsecWeb;
  double v35;
  long double v36;
  float parsecAppStore;
  double v38;
  long double v39;
  float parsecMaps;
  double v41;
  long double v42;
  float parsecWiki;
  double v44;
  long double v45;
  unint64_t v46;
  float parsecNews;
  double v48;
  long double v49;
  unint64_t v50;
  float parsecStocks;
  double v52;
  long double v53;
  unint64_t v54;
  float parsecWeather;
  double v56;
  long double v57;
  unint64_t v58;
  float parsecOther;
  double v60;
  long double v61;
  unint64_t v62;
  float webSuggestions;
  double v64;
  long double v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;

  appLaunch = self->_appLaunch;
  v4 = appLaunch;
  if (appLaunch < 0.0)
    v4 = -appLaunch;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  onDeviceAddressBookData = self->_onDeviceAddressBookData;
  v8 = onDeviceAddressBookData;
  if (onDeviceAddressBookData < 0.0)
    v8 = -onDeviceAddressBookData;
  v9 = round(v8);
  v10 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  onDeviceOtherPersonalData = self->_onDeviceOtherPersonalData;
  v12 = onDeviceOtherPersonalData;
  if (onDeviceOtherPersonalData < 0.0)
    v12 = -onDeviceOtherPersonalData;
  v13 = round(v12);
  v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  punchout = self->_punchout;
  v16 = punchout;
  if (punchout < 0.0)
    v16 = -punchout;
  v17 = round(v16);
  v79 = v10 ^ v14 ^ ((unint64_t)(fmod(v17, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v16 - v17, 0x40uLL));
  thirdPartyInAppContent = self->_thirdPartyInAppContent;
  v19 = thirdPartyInAppContent;
  if (thirdPartyInAppContent < 0.0)
    v19 = -thirdPartyInAppContent;
  v20 = round(v19);
  v21 = (unint64_t)(fmod(v20, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v19 - v20, 0x40uLL);
  parsec = self->_parsec;
  v23 = parsec;
  if (parsec < 0.0)
    v23 = -parsec;
  v24 = round(v23);
  v78 = v21 ^ ((unint64_t)(fmod(v24, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v23 - v24, 0x40uLL));
  querySuggestion = self->_querySuggestion;
  v26 = querySuggestion;
  if (querySuggestion < 0.0)
    v26 = -querySuggestion;
  v27 = round(v26);
  v77 = (unint64_t)(fmod(v27, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v26 - v27, 0x40uLL);
  other = self->_other;
  v29 = other;
  if (other < 0.0)
    v29 = -other;
  v30 = round(v29);
  v76 = (unint64_t)(fmod(v30, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v29 - v30, 0x40uLL);
  v75 = 2654435761 * self->_totalEngagements;
  siriSuggestions = self->_siriSuggestions;
  v32 = siriSuggestions;
  if (siriSuggestions < 0.0)
    v32 = -siriSuggestions;
  v33 = round(v32);
  v74 = (unint64_t)(fmod(v33, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v32 - v33, 0x40uLL);
  parsecWeb = self->_parsecWeb;
  v35 = parsecWeb;
  if (parsecWeb < 0.0)
    v35 = -parsecWeb;
  v36 = round(v35);
  v73 = (unint64_t)(fmod(v36, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v35 - v36, 0x40uLL);
  parsecAppStore = self->_parsecAppStore;
  v38 = parsecAppStore;
  if (parsecAppStore < 0.0)
    v38 = -parsecAppStore;
  v39 = round(v38);
  v72 = (unint64_t)(fmod(v39, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v38 - v39, 0x40uLL);
  parsecMaps = self->_parsecMaps;
  v41 = parsecMaps;
  if (parsecMaps < 0.0)
    v41 = -parsecMaps;
  v42 = round(v41);
  v71 = (unint64_t)(fmod(v42, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v41 - v42, 0x40uLL);
  parsecWiki = self->_parsecWiki;
  v44 = parsecWiki;
  if (parsecWiki < 0.0)
    v44 = -parsecWiki;
  v45 = round(v44);
  v46 = (unint64_t)(fmod(v45, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v44 - v45, 0x40uLL);
  parsecNews = self->_parsecNews;
  v48 = parsecNews;
  if (parsecNews < 0.0)
    v48 = -parsecNews;
  v49 = round(v48);
  v50 = (unint64_t)(fmod(v49, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v48 - v49, 0x40uLL);
  parsecStocks = self->_parsecStocks;
  v52 = parsecStocks;
  if (parsecStocks < 0.0)
    v52 = -parsecStocks;
  v53 = round(v52);
  v54 = (unint64_t)(fmod(v53, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v52 - v53, 0x40uLL);
  parsecWeather = self->_parsecWeather;
  v56 = parsecWeather;
  if (parsecWeather < 0.0)
    v56 = -parsecWeather;
  v57 = round(v56);
  v58 = (unint64_t)(fmod(v57, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v56 - v57, 0x40uLL);
  parsecOther = self->_parsecOther;
  v60 = parsecOther;
  if (parsecOther < 0.0)
    v60 = -parsecOther;
  v61 = round(v60);
  v62 = (unint64_t)(fmod(v61, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v60 - v61, 0x40uLL);
  webSuggestions = self->_webSuggestions;
  v64 = webSuggestions;
  if (webSuggestions < 0.0)
    v64 = -webSuggestions;
  v65 = round(v64);
  v66 = (unint64_t)(fmod(v65, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v64 - v65, 0x40uLL);
  v67 = -[_CPEngagementTriggerRatio hash](self->_topHitTriggerRatio, "hash");
  v68 = -[_CPEngagementTriggerRatio hash](self->_querySuggestionTriggerRatio, "hash");
  v69 = 2654435761 * self->_totalTopHitEngagements;
  return v79 ^ v78 ^ v75 ^ v77 ^ v76 ^ v74 ^ v73 ^ v72 ^ v71 ^ v46 ^ v50 ^ v54 ^ v58 ^ v67 ^ v62 ^ v68 ^ v66 ^ v69 ^ -[_CPEngagementShareRatio hash](self->_engagementShareRatio, "hash");
}

- (float)appLaunch
{
  return self->_appLaunch;
}

- (void)setAppLaunch:(float)a3
{
  self->_appLaunch = a3;
}

- (float)onDeviceAddressBookData
{
  return self->_onDeviceAddressBookData;
}

- (void)setOnDeviceAddressBookData:(float)a3
{
  self->_onDeviceAddressBookData = a3;
}

- (float)onDeviceOtherPersonalData
{
  return self->_onDeviceOtherPersonalData;
}

- (void)setOnDeviceOtherPersonalData:(float)a3
{
  self->_onDeviceOtherPersonalData = a3;
}

- (float)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(float)a3
{
  self->_punchout = a3;
}

- (float)thirdPartyInAppContent
{
  return self->_thirdPartyInAppContent;
}

- (void)setThirdPartyInAppContent:(float)a3
{
  self->_thirdPartyInAppContent = a3;
}

- (float)parsec
{
  return self->_parsec;
}

- (void)setParsec:(float)a3
{
  self->_parsec = a3;
}

- (float)querySuggestion
{
  return self->_querySuggestion;
}

- (void)setQuerySuggestion:(float)a3
{
  self->_querySuggestion = a3;
}

- (float)other
{
  return self->_other;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (float)siriSuggestions
{
  return self->_siriSuggestions;
}

- (void)setSiriSuggestions:(float)a3
{
  self->_siriSuggestions = a3;
}

- (float)parsecWeb
{
  return self->_parsecWeb;
}

- (void)setParsecWeb:(float)a3
{
  self->_parsecWeb = a3;
}

- (float)parsecAppStore
{
  return self->_parsecAppStore;
}

- (void)setParsecAppStore:(float)a3
{
  self->_parsecAppStore = a3;
}

- (float)parsecMaps
{
  return self->_parsecMaps;
}

- (void)setParsecMaps:(float)a3
{
  self->_parsecMaps = a3;
}

- (float)parsecWiki
{
  return self->_parsecWiki;
}

- (void)setParsecWiki:(float)a3
{
  self->_parsecWiki = a3;
}

- (float)parsecNews
{
  return self->_parsecNews;
}

- (void)setParsecNews:(float)a3
{
  self->_parsecNews = a3;
}

- (float)parsecStocks
{
  return self->_parsecStocks;
}

- (void)setParsecStocks:(float)a3
{
  self->_parsecStocks = a3;
}

- (float)parsecWeather
{
  return self->_parsecWeather;
}

- (void)setParsecWeather:(float)a3
{
  self->_parsecWeather = a3;
}

- (float)parsecOther
{
  return self->_parsecOther;
}

- (void)setParsecOther:(float)a3
{
  self->_parsecOther = a3;
}

- (float)webSuggestions
{
  return self->_webSuggestions;
}

- (void)setWebSuggestions:(float)a3
{
  self->_webSuggestions = a3;
}

- (_CPEngagementTriggerRatio)topHitTriggerRatio
{
  return self->_topHitTriggerRatio;
}

- (void)setTopHitTriggerRatio:(id)a3
{
  objc_storeStrong((id *)&self->_topHitTriggerRatio, a3);
}

- (_CPEngagementTriggerRatio)querySuggestionTriggerRatio
{
  return self->_querySuggestionTriggerRatio;
}

- (void)setQuerySuggestionTriggerRatio:(id)a3
{
  objc_storeStrong((id *)&self->_querySuggestionTriggerRatio, a3);
}

- (int)totalTopHitEngagements
{
  return self->_totalTopHitEngagements;
}

- (void)setTotalTopHitEngagements:(int)a3
{
  self->_totalTopHitEngagements = a3;
}

- (_CPEngagementShareRatio)engagementShareRatio
{
  return self->_engagementShareRatio;
}

- (void)setEngagementShareRatio:(id)a3
{
  objc_storeStrong((id *)&self->_engagementShareRatio, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementShareRatio, 0);
  objc_storeStrong((id *)&self->_querySuggestionTriggerRatio, 0);
  objc_storeStrong((id *)&self->_topHitTriggerRatio, 0);
}

@end
