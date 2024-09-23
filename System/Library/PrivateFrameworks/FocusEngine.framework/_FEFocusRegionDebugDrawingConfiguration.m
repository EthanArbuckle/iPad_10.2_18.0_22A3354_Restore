@implementation _FEFocusRegionDebugDrawingConfiguration

+ (id)itemConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegion:baseHue:patternAlpha:dashedStroke:", v4, 0, 0.75, 0.3);

  return v5;
}

+ (id)guideConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegion:baseHue:patternAlpha:dashedStroke:", v4, 0, 0.53, 0.1);

  return v5;
}

+ (id)containerGuideConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegion:baseHue:patternAlpha:dashedStroke:", v4, 1, 0.53, 0.4);

  return v5;
}

+ (id)promiseConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegion:baseHue:patternAlpha:dashedStroke:", v4, 0, 0.75, 0.3);

  return v5;
}

- (_FEFocusRegionDebugDrawingConfiguration)initWithRegion:(id)a3 baseHue:(double)a4 patternAlpha:(double)a5 dashedStroke:(BOOL)a6
{
  uint64_t v9;
  _FEFocusRegionDebugDrawingConfiguration *v10;
  _FEFocusRegionDebugDrawingConfiguration *v11;
  id color;
  objc_super v14;

  v9 = (uint64_t)a3;
  v14.receiver = self;
  v14.super_class = (Class)_FEFocusRegionDebugDrawingConfiguration;
  v10 = -[_FEFocusRegionDebugDrawingConfiguration init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    color = v10->_color;
    v10->_color = 0;

    v11->_patternAlpha = a5;
    v11->_pattern = (CGPattern *)(v9 / 21 % 6 + 1);
    v11->_dashedStroke = a6;
  }

  return v11;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

- (id)color
{
  return self->_color;
}

- (double)patternAlpha
{
  return self->_patternAlpha;
}

- (CGPattern)pattern
{
  return self->_pattern;
}

- (BOOL)dashedStroke
{
  return self->_dashedStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_color, 0);
  objc_storeStrong(&self->_associatedObject, 0);
}

@end
