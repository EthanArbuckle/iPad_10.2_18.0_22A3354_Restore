@implementation CLRacingRouteParameters

- (CLRacingRouteParameters)initWithRouteMatrixIndexVec:(id)a3 racingRouteVariables:(id)a4 startPointOnCurrentRoute:(id)a5 startPointOnReferenceRoute:(id)a6 lastOnRouteDataPoint:(id)a7 lastProjectedDataPoint:(id)a8 routeBoundingBox:(id)a9
{
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CLRacingRouteParameters *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CLRacingRouteParameters;
  v18 = -[CLRacingRouteParameters init](&v38, sel_init);
  if (v18)
  {
    v18->_routeMatrixIndexVec = (NSArray *)objc_msgSend_copy(a3, v15, v16, v17);
    v18->_racingRouteVariables = (CLRacingRouteVariables *)objc_msgSend_copy(a4, v19, v20, v21);
    v18->_startPointOnCurrentRoute = (CLRacingRouteState *)objc_msgSend_copy(a5, v22, v23, v24);
    v18->_startPointOnReferenceRoute = (CLRacingRouteState *)objc_msgSend_copy(a6, v25, v26, v27);
    v18->_lastOnRouteDataPoint = (CLRacingRouteState *)objc_msgSend_copy(a7, v28, v29, v30);
    v18->_lastProjectedDataPoint = (CLRacingRouteState *)objc_msgSend_copy(a8, v31, v32, v33);
    v18->_routeBoundingBox = (CLRouteBoundingBox *)objc_msgSend_copy(a9, v34, v35, v36);
  }
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLRacingRouteParameters *v4;
  const char *v5;

  v4 = [CLRacingRouteParameters alloc];
  return (id)objc_msgSend_initWithRouteMatrixIndexVec_racingRouteVariables_startPointOnCurrentRoute_startPointOnReferenceRoute_lastOnRouteDataPoint_lastProjectedDataPoint_routeBoundingBox_(v4, v5, (uint64_t)self->_routeMatrixIndexVec, (uint64_t)self->_racingRouteVariables, self->_startPointOnCurrentRoute, self->_startPointOnReferenceRoute, self->_lastOnRouteDataPoint, self->_lastProjectedDataPoint, self->_routeBoundingBox);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t started;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ProjectedDataPoint;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;

  v6 = objc_msgSend_routeMatrixIndexVec(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("routeMatrixIndexVec"));
  v11 = objc_msgSend_racingRouteVariables(self, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, (uint64_t)CFSTR("racingRouteVariables"));
  started = objc_msgSend_startPointOnCurrentRoute(self, v13, v14, v15);
  objc_msgSend_encodeObject_forKey_(a3, v17, started, (uint64_t)CFSTR("startPointOnCurrentRoute"));
  v21 = objc_msgSend_startPointOnReferenceRoute(self, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, (uint64_t)CFSTR("startPointOnReferenceRoute"));
  v26 = objc_msgSend_lastOnRouteDataPoint(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(a3, v27, v26, (uint64_t)CFSTR("lastOnRouteDataPoint"));
  ProjectedDataPoint = objc_msgSend_lastProjectedDataPoint(self, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(a3, v32, ProjectedDataPoint, (uint64_t)CFSTR("lastProjectedDataPoint"));
  v36 = objc_msgSend_routeBoundingBox(self, v33, v34, v35);
  objc_msgSend_encodeObject_forKey_(a3, v37, v36, (uint64_t)CFSTR("routeBoundingBox"));
}

- (CLRacingRouteParameters)initWithCoder:(id)a3
{
  CLRacingRouteParameters *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = [CLRacingRouteParameters alloc];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v33, 2);
  v10 = objc_msgSend_setWithArray_(v5, v8, v7, v9);
  v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("routeMatrixIndexVec"));
  v13 = objc_opt_class();
  v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("racingRouteVariables"));
  v16 = objc_opt_class();
  v18 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("startPointOnCurrentRoute"));
  v19 = objc_opt_class();
  v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("startPointOnReferenceRoute"));
  v22 = objc_opt_class();
  v24 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, (uint64_t)CFSTR("lastOnRouteDataPoint"));
  v25 = objc_opt_class();
  v27 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, (uint64_t)CFSTR("lastProjectedDataPoint"));
  v28 = objc_opt_class();
  v30 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v29, v28, (uint64_t)CFSTR("routeBoundingBox"));
  return (CLRacingRouteParameters *)objc_msgSend_initWithRouteMatrixIndexVec_racingRouteVariables_startPointOnCurrentRoute_startPointOnReferenceRoute_lastOnRouteDataPoint_lastProjectedDataPoint_routeBoundingBox_(v4, v31, v12, v15, v18, v21, v24, v27, v30, v33[0]);
}

- (NSArray)routeMatrixIndexVec
{
  return self->_routeMatrixIndexVec;
}

- (CLRacingRouteVariables)racingRouteVariables
{
  return self->_racingRouteVariables;
}

- (CLRacingRouteState)startPointOnCurrentRoute
{
  return self->_startPointOnCurrentRoute;
}

- (CLRacingRouteState)startPointOnReferenceRoute
{
  return self->_startPointOnReferenceRoute;
}

- (CLRacingRouteState)lastOnRouteDataPoint
{
  return self->_lastOnRouteDataPoint;
}

- (CLRacingRouteState)lastProjectedDataPoint
{
  return self->_lastProjectedDataPoint;
}

- (CLRouteBoundingBox)routeBoundingBox
{
  return self->_routeBoundingBox;
}

@end
