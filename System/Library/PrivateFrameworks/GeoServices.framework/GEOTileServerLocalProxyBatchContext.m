@implementation GEOTileServerLocalProxyBatchContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileRequester, 0);
  objc_storeStrong((id *)&self->_cacheMissStaleUnusableDataList, 0);
  objc_storeStrong((id *)&self->_cacheMissStaleDataList, 0);
  objc_storeStrong((id *)&self->_cacheMissNoDataList, 0);
  objc_storeStrong((id *)&self->_pendingRequesterList, 0);
  objc_storeStrong((id *)&self->_requesterList, 0);
  objc_storeStrong((id *)&self->_interestList, 0);
  objc_storeStrong((id *)&self->_fullList, 0);
}

- (void)setRequesterList:(id)a3
{
  objc_storeStrong((id *)&self->_requesterList, a3);
}

- (void)setProactivelyLoadOnFailure:(BOOL)a3
{
  self->_proactivelyLoadOnFailure = a3;
}

- (void)setLoadReason:(unsigned __int8)a3
{
  self->_loadReason = a3;
}

- (void)setInterestList:(id)a3
{
  objc_storeStrong((id *)&self->_interestList, a3);
}

- (void)setFullList:(id)a3
{
  objc_storeStrong((id *)&self->_fullList, a3);
}

- (void)setCacheMissStaleUnusableDataList:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMissStaleUnusableDataList, a3);
}

- (void)setCacheMissStaleDataList:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMissStaleDataList, a3);
}

- (void)setCacheMissNoDataList:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMissNoDataList, a3);
}

- (GEOTileKeyList)interestList
{
  return self->_interestList;
}

- (GEOTileKeyList)pendingRequesterList
{
  return self->_pendingRequesterList;
}

- (unsigned)loadReason
{
  return self->_loadReason;
}

- (GEOTileRequester)tileRequester
{
  return self->_tileRequester;
}

- (void)setTileRequester:(id)a3
{
  objc_storeStrong((id *)&self->_tileRequester, a3);
}

- (void)setPendingRequesterList:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequesterList, a3);
}

- (GEOTileKeyList)cacheMissNoDataList
{
  return self->_cacheMissNoDataList;
}

- (GEOTileKeyList)fullList
{
  return self->_fullList;
}

- (GEOTileKeyList)requesterList
{
  return self->_requesterList;
}

- (GEOTileKeyList)cacheMissStaleDataList
{
  return self->_cacheMissStaleDataList;
}

- (GEOTileKeyList)cacheMissStaleUnusableDataList
{
  return self->_cacheMissStaleUnusableDataList;
}

- (BOOL)proactivelyLoadOnFailure
{
  return self->_proactivelyLoadOnFailure;
}

@end
