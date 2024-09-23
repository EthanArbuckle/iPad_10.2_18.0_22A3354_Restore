@implementation GEOResultRefinementOpenOptions

- (GEOResultRefinementOpenOptions)initWithOpenOptions:(id)a3
{
  id *v4;
  GEOResultRefinementOpenOptions *v5;
  GEOResultRefinementTime *v6;
  void *v7;
  uint64_t v8;
  GEOResultRefinementTime *openAt;
  GEOResultRefinementToggle *v10;
  void *v11;
  uint64_t v12;
  GEOResultRefinementToggle *openNow;
  uint64_t v14;
  NSString *displayName;
  objc_super v17;

  v4 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOResultRefinementOpenOptions;
  v5 = -[GEOResultRefinementOpenOptions init](&v17, sel_init);
  if (v5)
  {
    v6 = [GEOResultRefinementTime alloc];
    -[GEOPDResultRefinementOpenOptions openAt](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GEOResultRefinementTime initWithResultRefinementTime:](v6, "initWithResultRefinementTime:", v7);
    openAt = v5->_openAt;
    v5->_openAt = (GEOResultRefinementTime *)v8;

    v10 = [GEOResultRefinementToggle alloc];
    -[GEOPDResultRefinementOpenOptions openNow](v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOResultRefinementToggle initWithResultRefinementToggle:](v10, "initWithResultRefinementToggle:", v11);
    openNow = v5->_openNow;
    v5->_openNow = (GEOResultRefinementToggle *)v12;

    -[GEOPDResultRefinementOpenOptions displayName](v4);
    v14 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v14;

  }
  return v5;
}

- (GEOResultRefinementOpenOptions)initWithDisplayName:(id)a3 openNow:(id)a4 openAt:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOResultRefinementOpenOptions *v11;
  GEOResultRefinementOpenOptions *v12;
  uint64_t v13;
  NSString *displayName;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOResultRefinementOpenOptions;
  v11 = -[GEOResultRefinementOpenOptions init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_openAt, a5);
    objc_storeStrong((id *)&v12->_openNow, a4);
    v13 = objc_msgSend(v8, "copy");
    displayName = v12->_displayName;
    v12->_displayName = (NSString *)v13;

  }
  return v12;
}

- (id)convertToGEOPDResultRefinementOpenOptions
{
  GEOPDResultRefinementOpenOptions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(GEOPDResultRefinementOpenOptions);
  -[GEOResultRefinementOpenOptions displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementOpenOptions setDisplayName:]((uint64_t)v3, v4);

  -[GEOResultRefinementOpenOptions openAt](self, "openAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertToGEOPDResultRefinementTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementOpenOptions setOpenAt:]((uint64_t)v3, v6);

  -[GEOResultRefinementOpenOptions openNow](self, "openNow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertToGEOPDResultRefinementToggle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementOpenOptions setOpenNow:]((uint64_t)v3, v8);

  return v3;
}

- (GEOResultRefinementTime)openAt
{
  return self->_openAt;
}

- (void)setOpenAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GEOResultRefinementToggle)openNow
{
  return self->_openNow;
}

- (void)setOpenNow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_openNow, 0);
  objc_storeStrong((id *)&self->_openAt, 0);
}

@end
