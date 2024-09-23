@implementation _CPSafariUsagePropensity

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPSafariUsagePropensityReadFrom(self, (uint64_t)a3, v3);
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[_CPSafariUsagePropensity localGoto](self, "localGoto");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity localTap](self, "localTap");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecGoto](self, "parsecGoto");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecTap](self, "parsecTap");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity thirdPartyGoto](self, "thirdPartyGoto");
  if (v8 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity thirdPartyTap](self, "thirdPartyTap");
  if (v9 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity thirdPartyCompletionOrRecentSearch](self, "thirdPartyCompletionOrRecentSearch");
  if (v10 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity goToSite](self, "goToSite");
  if (v11 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity other](self, "other");
  if (v12 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecWeb](self, "parsecWeb");
  if (v13 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecAppStore](self, "parsecAppStore");
  if (v14 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecMaps](self, "parsecMaps");
  if (v15 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecWiki](self, "parsecWiki");
  if (v16 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecNews](self, "parsecNews");
  if (v17 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecStocks](self, "parsecStocks");
  if (v18 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecWeather](self, "parsecWeather");
  if (v19 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPSafariUsagePropensity parsecOther](self, "parsecOther");
  if (v20 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPSafariUsagePropensity totalEngagements](self, "totalEngagements"))
    PBDataWriterWriteInt32Field();
  -[_CPSafariUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_CPSafariUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPSafariUsagePropensity totalTopHitEngagements](self, "totalTopHitEngagements"))
    PBDataWriterWriteInt32Field();
  -[_CPSafariUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[_CPSafariUsagePropensity engagementShareRatio](self, "engagementShareRatio");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float localGoto;
  float v6;
  float localTap;
  float v8;
  float parsecGoto;
  float v10;
  float parsecTap;
  float v12;
  float thirdPartyGoto;
  float v14;
  float thirdPartyTap;
  float v16;
  float thirdPartyCompletionOrRecentSearch;
  float v18;
  float goToSite;
  float v20;
  float other;
  float v22;
  float parsecWeb;
  float v24;
  float parsecAppStore;
  float v26;
  float parsecMaps;
  float v28;
  float parsecWiki;
  float v30;
  float parsecNews;
  float v32;
  float parsecStocks;
  float v34;
  float parsecWeather;
  float v36;
  float parsecOther;
  float v38;
  int totalEngagements;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int totalTopHitEngagements;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  localGoto = self->_localGoto;
  objc_msgSend(v4, "localGoto");
  if (localGoto != v6)
    goto LABEL_31;
  localTap = self->_localTap;
  objc_msgSend(v4, "localTap");
  if (localTap != v8)
    goto LABEL_31;
  parsecGoto = self->_parsecGoto;
  objc_msgSend(v4, "parsecGoto");
  if (parsecGoto != v10)
    goto LABEL_31;
  parsecTap = self->_parsecTap;
  objc_msgSend(v4, "parsecTap");
  if (parsecTap != v12)
    goto LABEL_31;
  thirdPartyGoto = self->_thirdPartyGoto;
  objc_msgSend(v4, "thirdPartyGoto");
  if (thirdPartyGoto != v14)
    goto LABEL_31;
  thirdPartyTap = self->_thirdPartyTap;
  objc_msgSend(v4, "thirdPartyTap");
  if (thirdPartyTap != v16)
    goto LABEL_31;
  thirdPartyCompletionOrRecentSearch = self->_thirdPartyCompletionOrRecentSearch;
  objc_msgSend(v4, "thirdPartyCompletionOrRecentSearch");
  if (thirdPartyCompletionOrRecentSearch != v18)
    goto LABEL_31;
  goToSite = self->_goToSite;
  objc_msgSend(v4, "goToSite");
  if (goToSite != v20)
    goto LABEL_31;
  other = self->_other;
  objc_msgSend(v4, "other");
  if (other != v22)
    goto LABEL_31;
  parsecWeb = self->_parsecWeb;
  objc_msgSend(v4, "parsecWeb");
  if (parsecWeb != v24)
    goto LABEL_31;
  parsecAppStore = self->_parsecAppStore;
  objc_msgSend(v4, "parsecAppStore");
  if (parsecAppStore != v26)
    goto LABEL_31;
  parsecMaps = self->_parsecMaps;
  objc_msgSend(v4, "parsecMaps");
  if (parsecMaps != v28)
    goto LABEL_31;
  parsecWiki = self->_parsecWiki;
  objc_msgSend(v4, "parsecWiki");
  if (parsecWiki != v30)
    goto LABEL_31;
  parsecNews = self->_parsecNews;
  objc_msgSend(v4, "parsecNews");
  if (parsecNews != v32)
    goto LABEL_31;
  parsecStocks = self->_parsecStocks;
  objc_msgSend(v4, "parsecStocks");
  if (parsecStocks != v34)
    goto LABEL_31;
  parsecWeather = self->_parsecWeather;
  objc_msgSend(v4, "parsecWeather");
  if (parsecWeather != v36)
    goto LABEL_31;
  parsecOther = self->_parsecOther;
  objc_msgSend(v4, "parsecOther");
  if (parsecOther != v38)
    goto LABEL_31;
  totalEngagements = self->_totalEngagements;
  if (totalEngagements != objc_msgSend(v4, "totalEngagements"))
    goto LABEL_31;
  -[_CPSafariUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topHitTriggerRatio");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v40 == 0) == (v41 != 0))
    goto LABEL_30;
  -[_CPSafariUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_CPSafariUsagePropensity topHitTriggerRatio](self, "topHitTriggerRatio");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topHitTriggerRatio");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_31;
  }
  else
  {

  }
  totalTopHitEngagements = self->_totalTopHitEngagements;
  if (totalTopHitEngagements != objc_msgSend(v4, "totalTopHitEngagements"))
    goto LABEL_31;
  -[_CPSafariUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementShareRatio");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v40 == 0) == (v41 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[_CPSafariUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
  {

LABEL_34:
    v53 = 1;
    goto LABEL_32;
  }
  v49 = (void *)v48;
  -[_CPSafariUsagePropensity engagementShareRatio](self, "engagementShareRatio");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "engagementShareRatio");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v50, "isEqual:", v51);

  if ((v52 & 1) != 0)
    goto LABEL_34;
LABEL_31:
  v53 = 0;
LABEL_32:

  return v53;
}

- (unint64_t)hash
{
  float localGoto;
  double v4;
  long double v5;
  unint64_t v6;
  float localTap;
  double v8;
  long double v9;
  unint64_t v10;
  float parsecGoto;
  double v12;
  long double v13;
  unint64_t v14;
  float parsecTap;
  double v16;
  long double v17;
  unint64_t v18;
  float thirdPartyGoto;
  double v20;
  long double v21;
  unint64_t v22;
  float thirdPartyTap;
  double v24;
  long double v25;
  unint64_t v26;
  float thirdPartyCompletionOrRecentSearch;
  double v28;
  long double v29;
  unint64_t v30;
  float goToSite;
  double v32;
  long double v33;
  unint64_t v34;
  float other;
  double v36;
  long double v37;
  unint64_t v38;
  float parsecWeb;
  double v40;
  long double v41;
  unint64_t v42;
  float parsecAppStore;
  double v44;
  long double v45;
  unint64_t v46;
  float parsecMaps;
  double v48;
  long double v49;
  unint64_t v50;
  float parsecWiki;
  double v52;
  long double v53;
  unint64_t v54;
  float parsecNews;
  double v56;
  long double v57;
  unint64_t v58;
  float parsecStocks;
  double v60;
  long double v61;
  unint64_t v62;
  float parsecWeather;
  double v64;
  long double v65;
  unint64_t v66;
  float parsecOther;
  double v68;
  long double v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;

  localGoto = self->_localGoto;
  v4 = localGoto;
  if (localGoto < 0.0)
    v4 = -localGoto;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  localTap = self->_localTap;
  v8 = localTap;
  if (localTap < 0.0)
    v8 = -localTap;
  v9 = round(v8);
  v10 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  parsecGoto = self->_parsecGoto;
  v12 = parsecGoto;
  if (parsecGoto < 0.0)
    v12 = -parsecGoto;
  v13 = round(v12);
  v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  parsecTap = self->_parsecTap;
  v16 = parsecTap;
  if (parsecTap < 0.0)
    v16 = -parsecTap;
  v17 = round(v16);
  v18 = v10 ^ v14 ^ ((unint64_t)(fmod(v17, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v16 - v17, 0x40uLL));
  thirdPartyGoto = self->_thirdPartyGoto;
  v20 = thirdPartyGoto;
  if (thirdPartyGoto < 0.0)
    v20 = -thirdPartyGoto;
  v21 = round(v20);
  v22 = (unint64_t)(fmod(v21, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v20 - v21, 0x40uLL);
  thirdPartyTap = self->_thirdPartyTap;
  v24 = thirdPartyTap;
  if (thirdPartyTap < 0.0)
    v24 = -thirdPartyTap;
  v25 = round(v24);
  v26 = v22 ^ ((unint64_t)(fmod(v25, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v24 - v25, 0x40uLL));
  thirdPartyCompletionOrRecentSearch = self->_thirdPartyCompletionOrRecentSearch;
  v28 = thirdPartyCompletionOrRecentSearch;
  if (thirdPartyCompletionOrRecentSearch < 0.0)
    v28 = -thirdPartyCompletionOrRecentSearch;
  v29 = round(v28);
  v30 = v18 ^ v26 ^ ((unint64_t)(fmod(v29, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v28 - v29, 0x40uLL));
  goToSite = self->_goToSite;
  v32 = goToSite;
  if (goToSite < 0.0)
    v32 = -goToSite;
  v33 = round(v32);
  v34 = (unint64_t)(fmod(v33, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v32 - v33, 0x40uLL);
  other = self->_other;
  v36 = other;
  if (other < 0.0)
    v36 = -other;
  v37 = round(v36);
  v38 = v34 ^ ((unint64_t)(fmod(v37, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v36 - v37, 0x40uLL));
  parsecWeb = self->_parsecWeb;
  v40 = parsecWeb;
  if (parsecWeb < 0.0)
    v40 = -parsecWeb;
  v41 = round(v40);
  v42 = v38 ^ ((unint64_t)(fmod(v41, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v40 - v41, 0x40uLL));
  parsecAppStore = self->_parsecAppStore;
  v44 = parsecAppStore;
  if (parsecAppStore < 0.0)
    v44 = -parsecAppStore;
  v45 = round(v44);
  v46 = v30 ^ v42 ^ ((unint64_t)(fmod(v45, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v44 - v45, 0x40uLL));
  parsecMaps = self->_parsecMaps;
  v48 = parsecMaps;
  if (parsecMaps < 0.0)
    v48 = -parsecMaps;
  v49 = round(v48);
  v50 = (unint64_t)(fmod(v49, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v48 - v49, 0x40uLL);
  parsecWiki = self->_parsecWiki;
  v52 = parsecWiki;
  if (parsecWiki < 0.0)
    v52 = -parsecWiki;
  v53 = round(v52);
  v54 = v50 ^ ((unint64_t)(fmod(v53, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v52 - v53, 0x40uLL));
  parsecNews = self->_parsecNews;
  v56 = parsecNews;
  if (parsecNews < 0.0)
    v56 = -parsecNews;
  v57 = round(v56);
  v58 = v54 ^ ((unint64_t)(fmod(v57, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v56 - v57, 0x40uLL));
  parsecStocks = self->_parsecStocks;
  v60 = parsecStocks;
  if (parsecStocks < 0.0)
    v60 = -parsecStocks;
  v61 = round(v60);
  v62 = v58 ^ ((unint64_t)(fmod(v61, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v60 - v61, 0x40uLL));
  parsecWeather = self->_parsecWeather;
  v64 = parsecWeather;
  if (parsecWeather < 0.0)
    v64 = -parsecWeather;
  v65 = round(v64);
  v66 = (unint64_t)(fmod(v65, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v64 - v65, 0x40uLL);
  parsecOther = self->_parsecOther;
  v68 = parsecOther;
  if (parsecOther < 0.0)
    v68 = -parsecOther;
  v69 = round(v68);
  v70 = (unint64_t)(fmod(v69, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v68 - v69, 0x40uLL);
  v71 = 2654435761 * self->_totalEngagements;
  v72 = -[_CPEngagementTriggerRatio hash](self->_topHitTriggerRatio, "hash");
  v73 = 2654435761 * self->_totalTopHitEngagements;
  return v46 ^ v62 ^ v71 ^ v66 ^ v72 ^ v70 ^ v73 ^ -[_CPEngagementShareRatio hash](self->_engagementShareRatio, "hash");
}

- (float)localGoto
{
  return self->_localGoto;
}

- (void)setLocalGoto:(float)a3
{
  self->_localGoto = a3;
}

- (float)localTap
{
  return self->_localTap;
}

- (void)setLocalTap:(float)a3
{
  self->_localTap = a3;
}

- (float)parsecGoto
{
  return self->_parsecGoto;
}

- (void)setParsecGoto:(float)a3
{
  self->_parsecGoto = a3;
}

- (float)parsecTap
{
  return self->_parsecTap;
}

- (void)setParsecTap:(float)a3
{
  self->_parsecTap = a3;
}

- (float)thirdPartyGoto
{
  return self->_thirdPartyGoto;
}

- (void)setThirdPartyGoto:(float)a3
{
  self->_thirdPartyGoto = a3;
}

- (float)thirdPartyTap
{
  return self->_thirdPartyTap;
}

- (void)setThirdPartyTap:(float)a3
{
  self->_thirdPartyTap = a3;
}

- (float)thirdPartyCompletionOrRecentSearch
{
  return self->_thirdPartyCompletionOrRecentSearch;
}

- (void)setThirdPartyCompletionOrRecentSearch:(float)a3
{
  self->_thirdPartyCompletionOrRecentSearch = a3;
}

- (float)goToSite
{
  return self->_goToSite;
}

- (void)setGoToSite:(float)a3
{
  self->_goToSite = a3;
}

- (float)other
{
  return self->_other;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
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

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (_CPEngagementTriggerRatio)topHitTriggerRatio
{
  return self->_topHitTriggerRatio;
}

- (void)setTopHitTriggerRatio:(id)a3
{
  objc_storeStrong((id *)&self->_topHitTriggerRatio, a3);
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
  objc_storeStrong((id *)&self->_topHitTriggerRatio, 0);
}

@end
