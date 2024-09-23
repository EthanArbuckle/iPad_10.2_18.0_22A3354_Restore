@implementation GEOMapFeatureRunningTrackLane

- (GEOMapFeatureRunningTrackLane)initWithVMP4Lane:(const void *)a3 coordinates:(id)a4
{
  id v7;
  GEOMapFeatureRunningTrackLane *v8;
  GEOMapFeatureRunningTrackLane *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOMapFeatureRunningTrackLane;
  v8 = -[GEOMapFeatureRunningTrackLane init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = *(unsigned __int8 *)a3;
    v8->_width = *((_DWORD *)a3 + 10);
    v8->_flowlineOffset = *((_DWORD *)a3 + 11);
    objc_storeStrong((id *)&v8->_coordinates, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t type;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Invalid Track Lane Type (%u)>"), self->_type);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)*((_QWORD *)&off_1E1C10248 + type);
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: '%@'> width: %umm flowLineOffset: %umm coordinates: [%@]"), v5, self, v7, self->_width, self->_flowlineOffset, self->_coordinates);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)flowlineOffset
{
  return self->_flowlineOffset;
}

- (NSArray)coordinates
{
  return self->_coordinates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinates, 0);
}

@end
