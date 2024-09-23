@implementation MUPlaceCardImpressionsMetadata

- (unint64_t)moduleIndex
{
  return self->_moduleIndex;
}

- (void)setModuleIndex:(unint64_t)a3
{
  self->_moduleIndex = a3;
}

- (int)moduleType
{
  return self->_moduleType;
}

- (void)setModuleType:(int)a3
{
  self->_moduleType = a3;
}

- (BOOL)isEnriched
{
  return self->_enriched;
}

- (void)setEnriched:(BOOL)a3
{
  self->_enriched = a3;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  self->_businessId = a3;
}

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  self->_localSearchProviderId = a3;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
