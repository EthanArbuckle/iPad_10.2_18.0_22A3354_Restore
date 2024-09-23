@implementation IDSCKFetchRecordZoneChangesOptions

+ (Class)__class
{
  if (qword_1EE40B120 != -1)
    dispatch_once(&qword_1EE40B120, &unk_1E3C20718);
  return (Class)(id)qword_1EE40B118;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (IDSCKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
