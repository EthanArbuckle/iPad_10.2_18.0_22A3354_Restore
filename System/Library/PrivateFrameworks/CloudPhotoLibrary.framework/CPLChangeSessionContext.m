@implementation CPLChangeSessionContext

- (void)encodeWithCoder:(id)a3
{
  unint64_t estimatedInitialSizeForLocalLibrary;
  id v5;

  estimatedInitialSizeForLocalLibrary = self->_estimatedInitialSizeForLocalLibrary;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", estimatedInitialSizeForLocalLibrary, CFSTR("estimatedSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_estimatedInitialAssetCountForLocalLibrary, CFSTR("estimatedCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resetTracker, CFSTR("resetTracker"));

}

- (CPLChangeSessionContext)initWithCoder:(id)a3
{
  id v4;
  CPLChangeSessionContext *v5;
  uint64_t v6;
  CPLResetTracker *resetTracker;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLChangeSessionContext;
  v5 = -[CPLChangeSessionContext init](&v9, sel_init);
  if (v5)
  {
    v5->_estimatedInitialSizeForLocalLibrary = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("estimatedSize"));
    v5->_estimatedInitialAssetCountForLocalLibrary = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("estimatedCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resetTracker"));
    v6 = objc_claimAutoreleasedReturnValue();
    resetTracker = v5->_resetTracker;
    v5->_resetTracker = (CPLResetTracker *)v6;

  }
  return v5;
}

- (unint64_t)estimatedInitialSizeForLocalLibrary
{
  return self->_estimatedInitialSizeForLocalLibrary;
}

- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialSizeForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialAssetCountForLocalLibrary
{
  return self->_estimatedInitialAssetCountForLocalLibrary;
}

- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialAssetCountForLocalLibrary = a3;
}

- (CPLResetTracker)resetTracker
{
  return self->_resetTracker;
}

- (void)setResetTracker:(id)a3
{
  objc_storeStrong((id *)&self->_resetTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetTracker, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
