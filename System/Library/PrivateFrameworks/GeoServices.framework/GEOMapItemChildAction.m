@implementation GEOMapItemChildAction

- (GEOMapItemChildAction)initWithChildAction:(id)a3
{
  id *v4;
  GEOMapItemChildAction *v5;
  GEOMapItemChildAction *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  GEOMapItemChildActionSearch *v11;
  void *guideLocation;
  uint64_t v13;
  GEOMapItemChildActionSearch *childActionSearch;
  _QWORD *v15;
  uint64_t v16;
  GEOGuideLocation *v17;
  objc_super v19;

  v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapItemChildAction;
  v5 = -[GEOMapItemChildAction init](&v19, sel_init);
  if (v5)
  {
    v6 = 0;
    switch(-[GEOPDChildAction childActionType]((uint64_t)v4))
    {
      case 0u:
        goto LABEL_20;
      case 1u:
        v7 = 1;
        goto LABEL_13;
      case 2u:
        v7 = 2;
        goto LABEL_13;
      case 3u:
        v7 = 3;
        goto LABEL_13;
      case 4u:
        +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isMuninEnabled");

        if ((v9 & 1) == 0)
        {
          v6 = 0;
          goto LABEL_20;
        }
        v7 = 4;
LABEL_13:
        v5->_childActionType = v7;
        -[GEOPDChildAction childActionSearch](v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = [GEOMapItemChildActionSearch alloc];
          -[GEOPDChildAction childActionSearch](v4);
          guideLocation = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[GEOMapItemChildActionSearch initWithChildActionSearch:](v11, "initWithChildActionSearch:", guideLocation);
          childActionSearch = v5->_childActionSearch;
          v5->_childActionSearch = (GEOMapItemChildActionSearch *)v13;

        }
        else
        {
          -[GEOPDChildAction childActionGuides](v4);
          v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = v15[2];

            if (!v16)
              break;
            v17 = -[GEOGuideLocation initWithChildAction:]([GEOGuideLocation alloc], "initWithChildAction:", v4);
            guideLocation = v5->_guideLocation;
            v5->_guideLocation = v17;
          }
          else
          {
            guideLocation = 0;
          }
        }

        break;
      case 5u:
        v7 = 5;
        goto LABEL_13;
      case 6u:
        v7 = 6;
        goto LABEL_13;
      case 7u:
        v7 = 7;
        goto LABEL_13;
      case 8u:
        v7 = 8;
        goto LABEL_13;
      default:
        v7 = 0;
        goto LABEL_13;
    }
  }
  v6 = v5;
LABEL_20:

  return v6;
}

- (id)childActionTypeAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("UNKNOWN");
  else
    return off_1E1C0E678[a3 - 1];
}

- (int64_t)childActionType
{
  return self->_childActionType;
}

- (void)setChildActionType:(int64_t)a3
{
  self->_childActionType = a3;
}

- (GEOMapItemChildActionSearch)childActionSearch
{
  return self->_childActionSearch;
}

- (void)setChildActionSearch:(id)a3
{
  objc_storeStrong((id *)&self->_childActionSearch, a3);
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_childActionSearch, 0);
}

@end
