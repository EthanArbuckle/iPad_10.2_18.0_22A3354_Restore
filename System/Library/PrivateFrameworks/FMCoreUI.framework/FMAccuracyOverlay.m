@implementation FMAccuracyOverlay

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  -[FMAccuracyOverlay parentAnnotation](self, "parentAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = objc_opt_class();
  -[MKCircle coordinate](self, "coordinate");
  v8 = v7;
  -[MKCircle coordinate](self, "coordinate");
  v10 = v9;
  -[MKCircle radius](self, "radius");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> [%@] %.6f/%6f @ %f"), v6, self, v4, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MKAnnotation)parentAnnotation
{
  return (MKAnnotation *)objc_loadWeakRetained((id *)&self->_parentAnnotation);
}

- (void)setParentAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_parentAnnotation, a3);
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAnnotation);
}

@end
