@implementation _MKRoutingAppCoverageRegions

- (_MKRoutingAppCoverageRegions)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  _MKRoutingAppCoverageRegions *v7;
  _MKMultiPolygonGeoRegion *v8;
  void *v9;
  uint64_t v10;
  _MKMultiPolygonGeoRegion *regions;
  void *v12;
  NSString *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MKRoutingAppCoverageRegions;
  v7 = -[_MKRoutingAppCoverageRegions init](&v16, sel_init);
  if (!v7)
    goto LABEL_7;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    if (!a4)
      goto LABEL_8;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = MKErrorDomain;
    v17 = *MEMORY[0x1E0C9AFA8];
    v18[0] = CFSTR("Invalid URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    a4 = 0;
    goto LABEL_8;
  }
  v8 = [_MKMultiPolygonGeoRegion alloc];
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_MKMultiPolygonGeoRegion initWithContentsOfFile:error:](v8, "initWithContentsOfFile:error:", v9, a4);
  regions = v7->_regions;
  v7->_regions = (_MKMultiPolygonGeoRegion *)v10;

  if (!v7->_regions)
    goto LABEL_7;
  a4 = v7;
LABEL_8:

  return (_MKRoutingAppCoverageRegions *)a4;
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3
{
  return -[_MKMultiPolygonGeoRegion coordinateLiesInRegion:](self->_regions, "coordinateLiesInRegion:", a3.latitude, a3.longitude);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
