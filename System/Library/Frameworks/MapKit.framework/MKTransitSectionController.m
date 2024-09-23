@implementation MKTransitSectionController

- (MKTransitSectionController)init
{
  MKTransitSectionController *result;

  result = (MKTransitSectionController *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MKTransitSectionController)initWithMapItem:(id)a3 system:(id)a4
{
  id v7;
  id v8;
  MKTransitSectionController *v9;
  MKTransitSectionController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKTransitSectionController;
  v9 = -[MKTransitSectionController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_system, a4);
    v10->_needsBuildRows = 1;
  }

  return v10;
}

- (void)setDepartureCutoffDate:(id)a3
{
  NSDate *v5;
  NSDate *departureCutoffDate;
  BOOL v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  departureCutoffDate = self->_departureCutoffDate;
  if (departureCutoffDate != v5)
  {
    v8 = v5;
    v7 = -[NSDate isEqualToDate:](departureCutoffDate, "isEqualToDate:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_departureCutoffDate, a3);
      -[MKTransitSectionController _setNeedsBuildRows](self, "_setNeedsBuildRows");
      v5 = v8;
    }
  }

}

- (void)setExpiredHighFrequencyCutoffDate:(id)a3
{
  NSDate *v5;
  NSDate *expiredHighFrequencyCutoffDate;
  BOOL v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  expiredHighFrequencyCutoffDate = self->_expiredHighFrequencyCutoffDate;
  if (expiredHighFrequencyCutoffDate != v5)
  {
    v8 = v5;
    v7 = -[NSDate isEqualToDate:](expiredHighFrequencyCutoffDate, "isEqualToDate:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_expiredHighFrequencyCutoffDate, a3);
      -[MKTransitSectionController _setNeedsBuildRows](self, "_setNeedsBuildRows");
      v5 = v8;
    }
  }

}

- (void)setIncidentEntitiesToExclude:(id)a3
{
  NSSet *v5;
  NSSet *incidentEntitiesToExclude;
  BOOL v7;
  NSSet *v8;

  v5 = (NSSet *)a3;
  incidentEntitiesToExclude = self->_incidentEntitiesToExclude;
  if (incidentEntitiesToExclude != v5)
  {
    v8 = v5;
    v7 = -[NSSet isEqualToSet:](incidentEntitiesToExclude, "isEqualToSet:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_incidentEntitiesToExclude, a3);
      -[MKTransitSectionController _setNeedsBuildRows](self, "_setNeedsBuildRows");
      v5 = v8;
    }
  }

}

- (void)incrementPagingFilter
{
  void *v3;

  -[MKTransitSectionController _pagingFilter](self, "_pagingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLimitNumLines:", 0);

  -[MKTransitSectionController _setNeedsBuildRows](self, "_setNeedsBuildRows");
}

- (unint64_t)numberOfRows
{
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitSectionController _buildRows](self, "_buildRows");
  return self->_numberOfRows;
}

- (BOOL)hasFilteredRows
{
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitSectionController _buildRows](self, "_buildRows");
  return self->_numberOfFilteredRows || self->_numberOfFilteredLines != 0;
}

- (BOOL)hasFilteredLines
{
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitSectionController _buildRows](self, "_buildRows");
  return self->_numberOfFilteredLines != 0;
}

- (id)linesToShow
{
  if (-[MKTransitSectionController _needsBuildRows](self, "_needsBuildRows"))
    -[MKTransitSectionController _buildRows](self, "_buildRows");
  return self->_linesToShow;
}

- (BOOL)_needsBuildRows
{
  return self->_needsBuildRows;
}

- (void)_setNeedsBuildRows
{
  self->_needsBuildRows = 1;
}

- (void)_buildRows
{
  void *v3;

  -[MKTransitSectionController departureCutoffDate](self, "departureCutoffDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self->_numberOfFilteredRows = 0;
    self->_numberOfFilteredLines = 0;
    self->_needsBuildRows = 0;
  }
}

- (GEOTransitSystem)system
{
  return self->_system;
}

- (NSDate)departureCutoffDate
{
  return self->_departureCutoffDate;
}

- (NSDate)expiredHighFrequencyCutoffDate
{
  return self->_expiredHighFrequencyCutoffDate;
}

- (NSSet)incidentEntitiesToExclude
{
  return self->_incidentEntitiesToExclude;
}

- (unint64_t)numberOfFilteredLines
{
  return self->_numberOfFilteredLines;
}

- (MKTransitSectionPagingFilter)_pagingFilter
{
  return self->__pagingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentEntitiesToExclude, 0);
  objc_storeStrong((id *)&self->_expiredHighFrequencyCutoffDate, 0);
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_linesToShow, 0);
  objc_storeStrong((id *)&self->__pagingFilter, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
