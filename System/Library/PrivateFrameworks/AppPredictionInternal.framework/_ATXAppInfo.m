@implementation _ATXAppInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app2VecCluster, 0);
  objc_storeStrong((id *)&self->_subGenreIds, 0);
  objc_storeStrong((id *)&self->_genreId, 0);
  objc_storeStrong((id *)&self->_medianSecondsBetweenLaunches, 0);
  objc_storeStrong((id *)&self->_averageSecondsBetweenLaunches, 0);
  objc_storeStrong((id *)&self->_lastSpotlightLaunch, 0);
  objc_storeStrong((id *)&self->_lastLaunch, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (_ATXAppInfo)initWithBundleId:(id)a3 isExtension:(BOOL)a4 isEnterpriseApp:(BOOL)a5 installDate:(id)a6 lastLaunch:(id)a7 lastSpotlightLaunch:(id)a8 averageSecondsBetweenLaunches:(id)a9 medianSecondsBetweenLaunches:(id)a10 genreId:(id)a11 subGenreIds:(id)a12 app2VecCluster:(id)a13
{
  id v17;
  id v18;
  id v19;
  _ATXAppInfo *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _ATXAppInfo *v26;
  uint64_t v27;
  NSString *bundleId;
  uint64_t v29;
  NSDate *installDate;
  uint64_t v31;
  NSDate *lastLaunch;
  uint64_t v33;
  NSDate *lastSpotlightLaunch;
  uint64_t v35;
  NSNumber *averageSecondsBetweenLaunches;
  uint64_t v37;
  NSNumber *medianSecondsBetweenLaunches;
  uint64_t v39;
  NSNumber *genreId;
  uint64_t v41;
  NSArray *subGenreIds;
  uint64_t v43;
  NSNumber *app2VecCluster;
  void *v46;
  id v50;
  id v51;
  objc_super v52;

  v17 = a3;
  v51 = a6;
  v50 = a7;
  v18 = a8;
  v19 = a9;
  v20 = self;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("_ATXAppInfo.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v52.receiver = v20;
  v52.super_class = (Class)_ATXAppInfo;
  v26 = -[_ATXAppInfo init](&v52, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v25, "copy");
    bundleId = v26->_bundleId;
    v26->_bundleId = (NSString *)v27;

    v26->_isExtension = a4;
    v26->_isEnterpriseApp = a5;
    v29 = objc_msgSend(v51, "copy");
    installDate = v26->_installDate;
    v26->_installDate = (NSDate *)v29;

    v31 = objc_msgSend(v50, "copy");
    lastLaunch = v26->_lastLaunch;
    v26->_lastLaunch = (NSDate *)v31;

    v33 = objc_msgSend(v18, "copy");
    lastSpotlightLaunch = v26->_lastSpotlightLaunch;
    v26->_lastSpotlightLaunch = (NSDate *)v33;

    v35 = objc_msgSend(v19, "copy");
    averageSecondsBetweenLaunches = v26->_averageSecondsBetweenLaunches;
    v26->_averageSecondsBetweenLaunches = (NSNumber *)v35;

    v37 = objc_msgSend(v21, "copy");
    medianSecondsBetweenLaunches = v26->_medianSecondsBetweenLaunches;
    v26->_medianSecondsBetweenLaunches = (NSNumber *)v37;

    v39 = objc_msgSend(v22, "copy");
    genreId = v26->_genreId;
    v26->_genreId = (NSNumber *)v39;

    if (objc_msgSend(v23, "count"))
    {
      v41 = objc_msgSend(v23, "copy");
      subGenreIds = v26->_subGenreIds;
      v26->_subGenreIds = (NSArray *)v41;
    }
    else
    {
      subGenreIds = v26->_subGenreIds;
      v26->_subGenreIds = 0;
    }

    v43 = objc_msgSend(v24, "copy");
    app2VecCluster = v26->_app2VecCluster;
    v26->_app2VecCluster = (NSNumber *)v43;

  }
  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_ATXAppInfo initWithBundleId:isExtension:isEnterpriseApp:installDate:lastLaunch:lastSpotlightLaunch:averageSecondsBetweenLaunches:medianSecondsBetweenLaunches:genreId:subGenreIds:app2VecCluster:]([_ATXAppInfo alloc], "initWithBundleId:isExtension:isEnterpriseApp:installDate:lastLaunch:lastSpotlightLaunch:averageSecondsBetweenLaunches:medianSecondsBetweenLaunches:genreId:subGenreIds:app2VecCluster:", self->_bundleId, self->_isExtension, self->_isEnterpriseApp, self->_installDate, self->_lastLaunch, self->_lastSpotlightLaunch, self->_averageSecondsBetweenLaunches, self->_medianSecondsBetweenLaunches, self->_genreId, self->_subGenreIds, self->_app2VecCluster);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (void)setIsExtension:(BOOL)a3
{
  self->_isExtension = a3;
}

- (BOOL)isEnterpriseApp
{
  return self->_isEnterpriseApp;
}

- (void)setIsEnterpriseApp:(BOOL)a3
{
  self->_isEnterpriseApp = a3;
}

- (void)setInstallDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastLaunch
{
  return self->_lastLaunch;
}

- (void)setLastLaunch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastSpotlightLaunch
{
  return self->_lastSpotlightLaunch;
}

- (void)setLastSpotlightLaunch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)averageSecondsBetweenLaunches
{
  return self->_averageSecondsBetweenLaunches;
}

- (void)setAverageSecondsBetweenLaunches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)medianSecondsBetweenLaunches
{
  return self->_medianSecondsBetweenLaunches;
}

- (void)setMedianSecondsBetweenLaunches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)genreId
{
  return self->_genreId;
}

- (void)setGenreId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)subGenreIds
{
  return self->_subGenreIds;
}

- (void)setSubGenreIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)app2VecCluster
{
  return self->_app2VecCluster;
}

- (void)setApp2VecCluster:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
